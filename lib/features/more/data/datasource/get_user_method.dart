import 'package:cashier_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserMethod {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance.collection('users');

  Future<UserModel?> getData() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final snapshot = await _firestore.doc(currentUser.uid).get();
      if (snapshot.exists) {
        return UserModel(
          name: snapshot.data()!['name'],
          phone: snapshot.data()!['phone'],
        );
      }
    }
    return null;
  }
}
