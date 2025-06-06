import 'package:canary_project/presentation/auth/bloc/register/register_event.dart';

sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState{
  final String message;

  RegisterSuccess({required this.message});
}

final class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({required this.error});
}