import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';
 class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}  

class SignInButtonPressed extends LoginEvent {
  String email, password;
  SignInButtonPressed({@required this.email, @required this.password});
}