import 'package:canary_project/data/model/request/auth/login_request_model.dart';

sealed class LoginEvent {}

class LoginRequested extends LoginEvent {
  final LoginModelRequest requestModel;

  LoginRequested({required this.requestModel});    
}