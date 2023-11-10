
import 'package:flutter/material.dart';
import 'package:poupaai/features/sign_in/sign_in_state.dart';
import 'package:poupaai/services/auth_service.dart';
import 'package:poupaai/services/secure_storage.dart';

class SignInController extends ChangeNotifier {
  final AuthService _service;

  SignInController(this._service);

  SignInState _state = SignInIntialState();

  SignInState get state => _state;

  void _changeState(SignInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    const secureStorage = SecureStorage();
    _changeState(SignInLoadingState());

    try {
      final user = await _service.signIn(
        email: email,
        password: password,
      );

      if (user.id != null) {
        await secureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        );
        _changeState(SignInSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(
        SignInErrorState(
          e.toString(),
        ),
      );
    }
  }
}
