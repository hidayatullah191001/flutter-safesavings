import 'package:bloc/bloc.dart';
import 'package:safesavings/data/models/forms/sign_in_form_model.dart';
import 'package:safesavings/data/models/forms/sign_up_form_model.dart';
import 'package:safesavings/data/models/user_model.dart';
import 'package:safesavings/data/services/services.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());
          final res = await AuthServices.signUp(event.data);
          emit(AuthSuccess(res['user'], res['token']));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogin) {
        try {
          emit(AuthLoading());
          final res = await AuthServices.signIn(event.data);
          emit(AuthSuccess(res['user'], res['token']));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data =
              await AuthServices.getCredentiallFromLocal();
          final res = await AuthServices.signIn(data);
          emit(AuthSuccess(res['user'], res['token']));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());
          await AuthServices.logout();
          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
