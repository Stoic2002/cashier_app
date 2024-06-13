import 'package:bloc/bloc.dart';
import 'package:cashier_app/features/auth/data/models/user_model.dart';
import 'package:cashier_app/features/more/data/datasource/get_user_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserMethod getUserMethod;
  ProfileBloc(this.getUserMethod) : super(ProfileInitial()) {
    on<OnProfile>((event, emit) async {
      // TODO: implement event handler

      try {
        final userModel = await getUserMethod.getData();
        if (userModel != null) {
          emit(ProfileLoaded(userModel: userModel));
        } else {
          emit(ProfileFailure(message: 'User data not found'));
        }
      } catch (e) {
        emit(ProfileFailure(message: e.toString()));
      }
    });
  }
}
