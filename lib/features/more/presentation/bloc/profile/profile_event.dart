part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class OnProfile extends ProfileEvent {
  final UserModel userModel;

  OnProfile({required this.userModel});
}
