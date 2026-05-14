import 'package:local_auth/local_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityService {
  final LocalAuthentication _auth = LocalAuthentication();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> canAuthenticate() async {
    final bool canAuthenticateWithBiometrics = await _auth.canCheckBiometrics;
    final bool canAuthenticate = canAuthenticateWithBiometrics || await _auth.isDeviceSupported();
    return canAuthenticate;
  }

  Future<bool> authenticate() async {
    try {
      final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Vui lòng xác thực để mở ứng dụng',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      return didAuthenticate;
    } catch (e) {
      return false;
    }
  }

  Future<void> setPin(String pin) async {
    await _storage.write(key: 'user_pin', value: pin);
  }

  Future<bool> verifyPin(String pin) async {
    final savedPin = await _storage.read(key: 'user_pin');
    return savedPin == pin;
  }

  Future<bool> hasPin() async {
    final pin = await _storage.read(key: 'user_pin');
    return pin != null;
  }

  Future<void> enableBiometrics(bool enabled) async {
    await _storage.write(key: 'biometrics_enabled', value: enabled.toString());
  }

  Future<bool> isBiometricsEnabled() async {
    final enabled = await _storage.read(key: 'biometrics_enabled');
    return enabled == 'true';
  }
}
