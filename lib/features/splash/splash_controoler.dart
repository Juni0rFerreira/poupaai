
import 'package:flutter/foundation.dart';
import 'package:poupaai/features/splash/splash_state.dart';
import 'package:poupaai/services/secure_storage.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;

  SplashController(this._service);

  SplashState _state = SplashIntialState();

  SplashState get state => _state;

 void _changeState(SplashState newState) {
 _state = newState;
 notifyListeners();
}

  void isUserLogged() async {
    final result = await _service.readOne(key: "CURRENT_USER");
    
    if (result != null) {
      _changeState(SplashSuccessState());
    } else {
      _changeState(SplashErrorState());
    }
  }
}