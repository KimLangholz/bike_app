import 'package:flutter/material.dart';

class UserRepository {
  Future<String> authenticate({
    @required String email
  }) async {
    await Future.delayed(Duration(milliseconds: 100));
    return 'email';
  }

  Future<void> deleteEmail() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }
  
  Future<bool> hasEmail() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
