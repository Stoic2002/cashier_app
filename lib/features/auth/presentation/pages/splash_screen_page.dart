import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/router/app_router.dart';

import 'package:cashier_app/core/router/route_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user;

  @override
  void initState() {
    // TODO: implement initState
    user = FirebaseAuth.instance.currentUser;
    super.initState();
    openHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Assets.images.background.provider(), fit: BoxFit.cover)),
        child: Center(child: Assets.images.logo.svg(height: 140, width: 140)),
      ),
    );
  }

  openHome() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) async {
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get()
              .then((DocumentSnapshot snap) {
            if (snap.exists) {
              context.goNamed(RouteConstants.root,
                  pathParameters: PathParameters().toMap());
            }
          });
        } else {
          context.goNamed(RouteConstants.login);
        }
      },
    );
  }
}
