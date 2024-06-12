import 'package:cashier_app/core/constants/app_colors.dart';
import 'package:cashier_app/features/auth/data/models/user_model.dart';
import 'package:cashier_app/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:cashier_app/features/auth/presentation/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController unameController;
  late final TextEditingController emailController;
  late final TextEditingController nomorController;
  late final TextEditingController passwordController;

  bool _obscureText1 = true;
  bool _obscureText2 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    unameController = TextEditingController();
    emailController = TextEditingController();
    nomorController = TextEditingController();
    passwordController = TextEditingController();
  }

  void _togglePassword1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _togglePassword2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 55,
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Container(
                      width: 32,
                      height: 32,
                      color: Color.fromARGB(255, 216, 217, 218),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 43,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Username',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: double.infinity,
                  child: CustomTextFormField(
                      controller: unameController, hintText: "Enter username"),
                ),
                SizedBox(
                  height: 12,
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
                  child: CustomTextFormField(
                      controller: emailController, hintText: "Enter email"),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Phone number',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: double.infinity,
                  child: CustomTextFormField(
                      controller: nomorController,
                      hintText: "Enter phone number"),
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
                  child: CustomTextFormField(
                      obscureText: _obscureText1,
                      suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            !_obscureText1
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black87,
                          ),
                          onPressed: _togglePassword1),
                      hintText: "Enter password"),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: double.infinity,
                  child: CustomTextFormField(
                      obscureText: _obscureText2,
                      suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            !_obscureText2
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black87,
                          ),
                          onPressed: _togglePassword2),
                      controller: passwordController,
                      hintText: "Confirm password"),
                ),
                SizedBox(
                  height: 41,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return Container(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary),
                          onPressed: () {
                            final dataUser = UserModel(
                              name: unameController.text,
                              email: emailController.text,
                              phone: nomorController.text,
                            );
                            context.read<RegisterBloc>().add(OnRegister(
                                userModel: dataUser,
                                password: passwordController.text));
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
