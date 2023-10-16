part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;
  final UserModel user;
  const AuthSuccess(this.user, this.token);

  @override
  List<Object> get props => [user, token];
}

class AuthFailed extends AuthState {
  final String e;
  const AuthFailed(this.e);
  @override
  List<Object> get props => [e];
}
