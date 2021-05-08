import 'package:succes_project/login/bloc/login_bloc.dart';
import 'package:succes_project/login/bloc/login_bloc.dart';
import 'package:succes_project/login/bloc/login_event.dart';
import 'package:succes_project/login/bloc/login_state.dart';
import 'package:succes_project/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignInScreen extends StatelessWidget {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
 LoginBloc loginBloc;
 
  @override
  Widget build(BuildContext context) {
    loginBloc =BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
        
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF000000),
            
          ),
        ),
      ),
      body: Column(
        children: [
 BlocListener<LoginBloc,LoginState>(
              listener: (context,state)
              {
                if (state is LoginSucced){
                  Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                }
              },
              child: BlocBuilder<LoginBloc,LoginState>(
                builder: (context,state){
                    if (state is LoginLoading){
                      return Center(child: CircularProgressIndicator());
                    }
                    if(state is LoginFailed){
                      return buildError(state.message);
                    }
                    if (state is LoginSucced){
                      emailcontroller.text='';
                      passwordcontroller.text='';
                      return Container();

                    }
                    return Container();

              },),
              
              
              ),
            Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Form(
                  autovalidate: true,
                   
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), labelText: 'email'),
                            
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), labelText: 'email'),
                          
                          ),
                      SizedBox(height: 20),
                    RaisedButton(
                      

                      onPressed: (){
                        loginBloc.add(SignInButtonPressed(email: emailcontroller.text, password: passwordcontroller.text));
                      },
                     
                     )
                    ]
                    )
                    )
                    )
        ],
      
    ));
  }
  Widget buildError(String message) {
    return Text(message);
  }

}