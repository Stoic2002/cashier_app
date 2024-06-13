import 'package:cashier_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//Register method
  Future register(UserModel user, String password) async {
    try {
      if (user.name!.isNotEmpty &&
          user.email!.isNotEmpty &&
          user.phone!.isNotEmpty &&
          password.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: user.email.toString(),
          password: password,
        );
        String uid = credential.user!.uid;

        final userData = UserModel(
          userId: uid,
          name: user.name,
          phone: user.phone,
          email: user.email,
          role: "user",
          createdAt: DateTime.now(),
        );
        final register = await _firestore
            .collection('users')
            .doc(uid)
            .set(userData.toJson());
        return register;
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

//Login method
  Future<String> login(String email, String password) async {
    String res = 'Some error occurred';

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'Success';
      } else {
        res = 'Please enter all the field';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
