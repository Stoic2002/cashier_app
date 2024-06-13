import 'package:bloc/bloc.dart';
import 'package:cashier_app/features/auth/data/datasource/auth_method.dart';
import 'package:cashier_app/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthMethod _authMethod;
  RegisterBloc(this._authMethod) : super(RegisterInitial()) {
    on<OnRegister>((event, emit) async {
      // TODO: implement event handler
      emit(RegisterLoading());
      final result =
          await _authMethod.register(event.userModel, event.password);
      if (result is String) {
        // Terjadi error
        emit(RegisterFailure(message: result));
      } else {
        // Sukses
        emit(RegisterLoaded(userModel: result));
      }
    });
  }
}
