import 'package:firebase_core/firebase_core.dart';
import 'package:succes_project/register/bloc/register_bloc.dart';
import 'package:succes_project/repositories/user_repositories.dart';
import 'package:succes_project/ui/home_screen.dart';
import 'package:succes_project/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth_bloc.dart';
import 'login/bloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
UserRepository userRepository= UserRepository();
  


  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => LoginBloc(userRepository: userRepository),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home:MainScreen()
        ),
    
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BlocBuilder<AuthBloc,AuthState>(builder: (context,state){
        if (state is AuthInitial){
          return SplashScreen();
        }
        if(state is UnAuthenticateState){
          return SplashScreen();

        }
        else if( state is AuthenticateState){
          return HomeScreen();
        }
        return Container();
    }
    );
  }
}
