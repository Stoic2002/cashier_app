import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/router/app_router.dart';
import 'package:cashier_app/core/router/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () => context.goNamed(
        RouteConstants.root,
        pathParameters: PathParameters().toMap(),
      ),
    );
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
}
