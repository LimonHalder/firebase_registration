import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSucced extends RegisterState {
  User user;
  RegisterSucced({@required this.user});

   @override
  List<Object> get props => [user];

}
  
class RegisterFailed extends RegisterState {
  String message;
  RegisterFailed({@required this.message});
}