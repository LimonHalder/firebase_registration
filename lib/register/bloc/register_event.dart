import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
  
// ignore: must_be_immutable
class SignUpButtonPressed extends RegisterEvent {
  String email, password;
  SignUpButtonPressed({@required this.email, @required this.password});
}



