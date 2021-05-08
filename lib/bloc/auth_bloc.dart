import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:succes_project/repositories/user_repositories.dart';
import 'package:flutter/cupertino.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository ;

  
  AuthBloc({this.userRepository}) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppLoaded){
      try {
       var isSigned = await  userRepository.isSignedIn();
       if(isSigned){
         
        
         var user = await userRepository.getCurrentUser();
         yield AuthenticateState(user: user);
       }
       else{
         yield UnAuthenticateState();
       }
      } catch (e) {
        yield UnAuthenticateState();
      }
    }
  }
}
