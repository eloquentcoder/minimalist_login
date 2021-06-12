import 'package:equatable/equatable.dart';

// enum Status { INITIAL, LOADING, COMPLETED, ERROR }

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class InitialLogin extends LoginState {}

class LoginLoading extends LoginState {}

class LoginError extends LoginState {
  LoginError({required this.error});
  final String error;
}

class LoginSuccess extends LoginState {}
