import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_filex/open_filex.dart';

class ForceUpdateService {
  static const _owner = 'public-updater';
  static const _repo = 'VietLife-Note';

  static String? _latestVersion;
  static String? _downloadUrl;

  static Future<bool> checkForUpdate() async {
    try {
      debugPrint('[ForceUpdate] Checking for updates...');
      final response = await http.get(
        Uri.parse('https://api.github.com/repos/$_owner/$_repo/releases/latest'),
        headers: {
          'Accept': 'application/vnd.github+json',
          'User-Agent': 'VietLifeNote-App',
        },
      );

      debugPrint('[ForceUpdate] Status: ${response.statusCode}');
      if (response.statusCode != 200) return false;

      final data = jsonDecode(response.body);
      _latestVersion = (data['tag_name'] as String).replaceFirst('v', '');
      debugPrint('[ForceUpdate] Latest version: $_latestVersion');

      final assets = data['assets'] as List;
      for (final asset in assets) {
        if ((asset['name'] as String).endsWith('.apk')) {
          _downloadUrl = asset['browser_download_url'];
          break;
        }
      }

      if (_latestVersion == null || _downloadUrl == null) return false;

      final packageInfo = await PackageInfo.fromPlatform();
      debugPrint('[ForceUpdate] Current: ${packageInfo.version} vs Latest: $_latestVersion');
      final result = _isOlderVersion(packageInfo.version, _latestVersion!);
      debugPrint('[ForceUpdate] Needs update: $result');
      return result;
    } catch (e) {
      debugPrint('[ForceUpdate] Error: $e');
      return false;
    }
  }

  static bool _isOlderVersion(String current, String latest) {
    final currentParts = current.split('.').map(int.parse).toList();
    final latestParts = latest.split('.').map(int.parse).toList();

    for (int i = 0; i < 3; i++) {
      final c = i < currentParts.length ? currentParts[i] : 0;
      final l = i < latestParts.length ? latestParts[i] : 0;
      if (c < l) return true;
      if (c > l) return false;
    }
    return false;
  }

  static Future<void> showUpdateDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: _UpdateDialog(
          version: _latestVersion ?? '',
          downloadUrl: _downloadUrl ?? '',
        ),
      ),
    );
  }
}

class _UpdateDialog extends StatefulWidget {
  final String version;
  final String downloadUrl;

  const _UpdateDialog({required this.version, required this.downloadUrl});

  @override
  State<_UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<_UpdateDialog> {
  double _progress = 0;
  bool _downloading = false;
  String _status = '';

  Future<void> _downloadAndInstall() async {
    setState(() {
      _downloading = true;
      _status = 'Đang tải bản cập nhật...';
    });

    try {
      final client = http.Client();
      final request = http.Request('GET', Uri.parse(widget.downloadUrl));
      final response = await client.send(request);

      final contentLength = response.contentLength ?? 0;
      final dir = await getExternalStorageDirectory();
      final file = File('${dir!.path}/app-update_${DateTime.now().millisecondsSinceEpoch}.apk');
      
      // Cleanup any old update files in that directory to save space
      try {
        dir.listSync().forEach((entity) {
          if (entity is File && entity.path.contains('app-update')) {
            entity.deleteSync();
          }
        });
      } catch (e) {
        debugPrint('Error cleaning up old updates: $e');
      }

      final sink = file.openWrite();

      int received = 0;
      await response.stream.listen(
        (chunk) {
          sink.add(chunk);
          received += chunk.length;
          if (contentLength > 0) {
            setState(() {
              _progress = received / contentLength;
              _status = 'Đang tải... ${(_progress * 100).toStringAsFixed(0)}%';
            });
          }
        },
        onDone: () async {
          await sink.close();
          client.close();
          setState(() {
            _status = 'Đang cài đặt...';
          });
          await OpenFilex.open(file.path);
        },
        onError: (e) {
          setState(() {
            _downloading = false;
            _status = 'Lỗi tải: $e';
          });
        },
        cancelOnError: true,
      );
    } catch (e) {
      setState(() {
        _downloading = false;
        _status = 'Lỗi: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Row(
        children: [
          Icon(Icons.system_update, color: Colors.blue, size: 28),
          SizedBox(width: 8),
          Text('Cập nhật mới'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phiên bản ${widget.version} đã sẵn sàng!'),
          const SizedBox(height: 8),
          const Text('Vui lòng cập nhật để tiếp tục sử dụng.'),
          if (_downloading) ...[
            const SizedBox(height: 16),
            LinearProgressIndicator(value: _progress),
            const SizedBox(height: 8),
            Text(_status, style: const TextStyle(fontSize: 13)),
          ],
          if (!_downloading && _status.startsWith('Lỗi')) ...[
            const SizedBox(height: 8),
            Text(_status, style: const TextStyle(color: Colors.red, fontSize: 13)),
          ],
        ],
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: _downloading ? null : _downloadAndInstall,
          icon: const Icon(Icons.download),
          label: Text(_downloading ? 'Đang tải...' : 'Cập nhật ngay'),
        ),
      ],
    );
  }
}
