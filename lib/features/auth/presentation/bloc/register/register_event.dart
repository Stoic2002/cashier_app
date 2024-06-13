part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class OnRegister extends RegisterEvent {
  final UserModel userModel;
  final String password;

  OnRegister({required this.userModel, required this.password});
}
