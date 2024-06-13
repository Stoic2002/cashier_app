import 'package:cashier_app/core/assets/assets.gen.dart';
import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/core/router/app_router.dart';
import 'package:cashier_app/core/router/route_constants.dart';
import 'package:cashier_app/features/auth/data/datasource/auth_method.dart';
import 'package:cashier_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:cashier_app/features/auth/presentation/widget/custom_textformfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                  child: Assets.images.logo.svg(),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Welcome!',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'E-mail',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: CustomTextFormField(
                      controller: _emailController,
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Password',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: CustomTextFormField(
                      obscureText: _obscureText,
                      suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            !_obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black87,
                          ),
                          onPressed: _togglePassword),
                      controller: _passwordController,
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    textAlign: TextAlign.end,
                    'Forgot password?',
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      onPressed: () {
                        // context.read<LoginBloc>().add(OnLogin(
                        //     _emailController.text, _passwordController.text));
                        loginUser();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.end,
                        'Belum punya akun?',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushNamed(RouteConstants.registerPath);
                        },
                        child: Text(
                          textAlign: TextAlign.end,
                          'Register',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  void loginUser() async {
    try {
      String res = await AuthMethod()
          .login(_emailController.text, _passwordController.text);
      if (res == 'Success') {
        context.goNamed(RouteConstants.root,
            pathParameters: PathParameters().toMap());
      } else {}
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
