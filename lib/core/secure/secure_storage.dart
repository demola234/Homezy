import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:homezy/core/secure/flutter_secure_storage_provider.dart';
import 'package:homezy/core/secure/secure_key.dart';

abstract class SecureStorage {
  Future<void> setHiveKey(String value);
  Future<String?> getHiveKey();
}

final secureStorageProvider = Provider<SecureStorage>((ref) {
  final flutterSecureStorage = ref.watch(flutterSecureStorageProvider);

  return SecureStorageIpl(flutterSecureStorage);
});

class SecureStorageIpl implements SecureStorage {
  final FlutterSecureStorage _flutterSecureStorage;

  SecureStorageIpl(this._flutterSecureStorage);

  @override
  Future<String?> getHiveKey() async {
    return await _flutterSecureStorage.read(key: hiveKey);
  }

  @override
  Future<void> setHiveKey(String value) async {
    await _flutterSecureStorage.write(key: hiveKey, value: value);
  }
}
