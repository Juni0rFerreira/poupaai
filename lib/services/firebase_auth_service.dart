import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poupaai/common/models/user_model.dart';
import 'package:poupaai/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;
  final _function = FirebaseFunctions.instance; 

  @override
  Future<UserModel> signIn({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        await result.user!.updateDisplayName(name);
        return UserModel(
          name: _auth.currentUser?.displayName,
          email: _auth.currentUser?.email,
          id: _auth.currentUser?.uid,
        );
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> signUp({
    String? name,
    required String email,
    required String password,
  }) async {
    try {
      await _function.httpsCallable('registerUser').call({
        "email": email,
        "password": password,
        "displayName": name,
      });

      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        log(await _auth.currentUser?.getIdToken(true) ?? 'nulo');
        await result.user!.updateDisplayName(name);
        return UserModel(
          name: _auth.currentUser?.displayName,
          email: _auth.currentUser?.email,
          id: _auth.currentUser?.uid,
        );
      } else {
        throw Exception();
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } on FirebaseFunctionsException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
