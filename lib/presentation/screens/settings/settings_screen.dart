import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/presentation/providers/note_provider.dart';
import 'package:vietlife_note/presentation/providers/providers.dart';
import 'package:vietlife_note/presentation/providers/auth_provider.dart';
import 'package:vietlife_note/presentation/screens/login/login_screen.dart';
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final accentColor = ref.watch(accentColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
      ),
      body: ListView(
        children: [
          // Account Section
          _buildSection(
            context,
            title: 'Tài khoản',
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final authState = ref.watch(authProvider);
                  final user = authState.user;

                  if (user == null) {
                    return _buildTile(
                      context,
                      icon: PhosphorIconsRegular.userCircle,
                      title: 'Đăng nhập / Đăng ký',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        );
                      },
                    );
                  }

                  return Column(
                    children: [
                      _buildTile(
                        context,
                        icon: PhosphorIconsRegular.user,
                        title: user.displayName ?? user.phoneNumber ?? user.email ?? 'Người dùng',
                        trailing: Text(
                          'Đã đăng nhập',
                          style: TextStyle(color: Colors.green.shade600),
                        ),
                      ),
                      _buildTile(
                        context,
                        icon: PhosphorIconsRegular.cloudArrowUp,
                        title: 'Sao lưu dữ liệu',
                        onTap: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(child: CircularProgressIndicator()),
                          );

                          try {
                            await ref.read(noteProvider.notifier).performBackup();
                            if (context.mounted) {
                              Navigator.pop(context);
                              final result = ref.read(noteProvider).lastSyncResult;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result?.message ?? 'Sao lưu hoàn tất'),
                                  backgroundColor: result?.success == true ? Colors.green : Colors.red,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Lỗi sao lưu: $e'), backgroundColor: Colors.red),
                              );
                            }
                          }
                        },
                      ),
                      _buildTile(
                        context,
                        icon: PhosphorIconsRegular.cloudArrowDown,
                        title: 'Khôi phục dữ liệu',
                        onTap: () async {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(child: CircularProgressIndicator()),
                          );

                          try {
                            await ref.read(noteProvider.notifier).performFullSync();
                            if (context.mounted) {
                              Navigator.pop(context);
                              final result = ref.read(noteProvider).lastSyncResult;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result?.message ?? 'Khôi phục hoàn tất'),
                                  backgroundColor: result?.success == true ? Colors.green : Colors.red,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Lỗi khôi phục: $e'), backgroundColor: Colors.red),
                              );
                            }
                          }
                        },
                      ),
                      _buildTile(
                        context,
                        icon: PhosphorIconsRegular.signOut,
                        title: 'Đăng xuất',
                        onTap: () {
                          ref.read(authProvider.notifier).signOut();
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),

          // Appearance Section
          _buildSection(
            context,
            title: 'Giao diện',
            children: [
              _buildTile(
                context,
                icon: PhosphorIconsRegular.moon,
                title: 'Chế độ tối',
                trailing: Switch(
                  value: themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    ref.read(themeModeProvider.notifier).toggle(value);
                  },
                ),
              ),
              _buildTile(
                context,
                icon: PhosphorIconsRegular.palette,
                title: 'Màu chủ đạo',
                trailing: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: accentColor,
                    shape: BoxShape.circle,
                  ),
                ),
                onTap: () {
                  _showColorPicker(context, ref);
                },
              ),
            ],
          ),

          // Notifications Section
          _buildSection(
            context,
            title: 'Thông báo',
            children: [
              _buildTile(
                context,
                icon: PhosphorIconsRegular.bell,
                title: 'Thông báo đẩy',
                trailing: const Switch(
                  value: true,
                  onChanged: null,
                ),
              ),
              _buildTile(
                context,
                icon: PhosphorIconsRegular.clock,
                title: 'Nhắc nhở',
                onTap: () {
                  // Navigate to reminder settings
                },
              ),
            ],
          ),

          // Security Section
          _buildSection(
            context,
            title: 'Bảo mật',
            children: [
              _buildTile(
                context,
                icon: PhosphorIconsRegular.fingerprint,
                title: 'Xác thực sinh trắc học',
                trailing: const Switch(
                  value: false,
                  onChanged: null,
                ),
              ),
              _buildTile(
                context,
                icon: PhosphorIconsRegular.lock,
                title: 'Đặt mã PIN',
                onTap: () {
                  // Navigate to PIN setup
                },
              ),
            ],
          ),

          // Data Section
          const SizedBox(height: AppConstants.spacingL),

          // About Section
          _buildSection(
            context,
            title: 'Về ứng dụng',
            children: [
              _buildTile(
                context,
                icon: PhosphorIconsRegular.info,
                title: 'Phiên bản',
                trailing: FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    final version = snapshot.data?.version ?? '...';
                    return Text(
                      version,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                    );
                  },
                ),
              ),
              _buildTile(
                context,
                icon: PhosphorIconsRegular.star,
                title: 'Đánh giá ứng dụng',
                onTap: () {
                  // Rate app
                },
              ),
              _buildTile(
                context,
                icon: PhosphorIconsRegular.shieldCheck,
                title: 'Chính sách bảo mật',
                onTap: () {
                  // Privacy policy
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppConstants.spacingM),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        ...children,
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _showColorPicker(BuildContext context, WidgetRef ref) {
    final colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chọn màu chủ đạo'),
        content: SizedBox(
          width: 300,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: colors.length,
            itemBuilder: (context, index) {
              final color = colors[index];
              return InkWell(
                onTap: () {
                  ref.read(accentColorProvider.notifier).setColor(color);
                  Navigator.pop(context);
                },
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Đóng'),
          ),
        ],
      ),
    );
  }
}
