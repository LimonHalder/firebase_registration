part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => null;
}

class AuthInitial extends AuthState {}
class AuthenticateState extends AuthState {
  User user;
  AuthenticateState({@required this.user});
  @override
  List<Object> get props => null;
 
}
class UnAuthenticateState extends AuthState {}
