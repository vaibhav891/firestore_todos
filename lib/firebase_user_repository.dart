import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  FirebaseAuth _firebaseAuth;
  FirebaseUserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<String> getUserId() async {
    return (await _firebaseAuth.currentUser()).uid;
  }

  @override
  Future<bool> isAuthenticated() async {
    final _firebaseUser = await _firebaseAuth.currentUser();
    return _firebaseUser != null;
  }

  @override
  Future<void> authenticated() async {
    await _firebaseAuth.signInAnonymously();
  }
}
