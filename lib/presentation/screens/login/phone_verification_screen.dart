import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vietlife_note/core/constants/app_constants.dart';
import 'package:vietlife_note/presentation/providers/auth_provider.dart';

class PhoneVerificationScreen extends ConsumerStatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  ConsumerState<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends ConsumerState<PhoneVerificationScreen> {
  final _phoneController = TextEditingController();
  final _smsController = TextEditingController();
  bool _codeSent = false;
  String _verificationId = '';

  @override
  void dispose() {
    _phoneController.dispose();
    _smsController.dispose();
    super.dispose();
  }

  void _verifyPhone() {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;

    // Clean up phone number, extract only digits
    String cleanPhone = phone.replaceAll(RegExp(r'\D'), '');
    
    // Remove leading 84 or 0
    if (cleanPhone.startsWith('84')) {
      cleanPhone = cleanPhone.substring(2);
    } else if (cleanPhone.startsWith('0')) {
      cleanPhone = cleanPhone.substring(1);
    }

    final finalPhone = '+84$cleanPhone';

    ref.read(authProvider.notifier).verifyPhoneNumber(
      phoneNumber: finalPhone,
      onCodeSent: (verificationId, forceResendingToken) {
        setState(() {
          _codeSent = true;
          _verificationId = verificationId;
        });
      },
      onError: (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Lỗi: ${e.message}')),
        );
      },
    );
  }

  void _submitCode() {
    final code = _smsController.text.trim();
    if (code.isEmpty || _verificationId.isEmpty) return;

    ref.read(authProvider.notifier).signInWithSmsCode(
          verificationId: _verificationId,
          smsCode: code,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.user != null) {
        Navigator.of(context).pop(); // Go back to login screen which will redirect to Main
      }
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập bằng SĐT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_codeSent) ...[
              const Text(
                'Nhập số điện thoại của bạn',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppConstants.spacingM),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Số điện thoại',
                  prefixText: '+84 ',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppConstants.spacingL),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: authState.isLoading ? null : _verifyPhone,
                  child: authState.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Nhận mã OTP'),
                ),
              ),
            ] else ...[
              const Text(
                'Nhập mã OTP',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppConstants.spacingM),
              TextField(
                controller: _smsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Mã xác nhận 6 số',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: AppConstants.spacingL),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: authState.isLoading ? null : _submitCode,
                  child: authState.isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Xác nhận'),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
