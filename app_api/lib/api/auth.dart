import 'dart:async';

abstract class BaseAuth {
    Future<bool> signIn(String email, String password) async => (email == password);
}