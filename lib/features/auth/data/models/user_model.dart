import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String? name;
  final String? email;
  final String? phone;
  final String? role;
  final DateTime? createdAt;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.createdAt,
  });

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
        userId: snapshot['userId'],
        name: snapshot['name'],
        email: snapshot['email'],
        phone: snapshot['phone'],
        role: snapshot['role'],
        createdAt: snapshot['createdAt']);
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "createdAt": createdAt?.toIso8601String()
      };

  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? phone,
    String? role,
    DateTime? createdAt,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
