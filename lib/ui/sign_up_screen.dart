

import 'package:succes_project/register/bloc/register_bloc.dart';
import 'package:succes_project/register/bloc/register_event.dart';
import 'package:succes_project/register/bloc/register_state.dart';
import 'package:succes_project/ui/home_screen.dart';
import 'package:succes_project/ui/sign_up_2nd_screen.dart';
import 'package:flutter/material.dart';
import 'package:succes_project/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:succes_project/repositories/user_repositories.dart';
//import 'package:form_field_validator/form_field_validator.dart';



class SignUpScreen extends StatelessWidget {
  RegisterBloc registerBloc;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    registerBloc = BlocProvider.of<RegisterBloc>(context);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocListener<RegisterBloc,RegisterState>(
              listener: (context,state)
              {
                if (state is RegisterSucced){
                  Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SignUp2ndScreen()));
                }
              },
              child: BlocBuilder<RegisterBloc,RegisterState>(
                builder: (context,state){
                    if (state is RegisterLoading){
                      return Center(child: CircularProgressIndicator());
                    }
                    if(state is RegisterFailed){
                      return buildError(state.message);
                    }
                    if (state is RegisterSucced){
                      emailcontroller.text='';
                      passwordcontroller.text='';
                      return Container();

                    }
                    return Container();

              },),
              
              
              ),
            Container(
                width: MediaQuery.of(context).size.width * 0.90,
              
                    
                    child: Column(children: <Widget>[
                     
                     CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      textEditingController:emailcontroller,
                      hintText: 'email',
                      color: Color(0xFFdeaaff),
                    ),
                      SizedBox(height: 20),
                      CustomTextField(
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      textEditingController:passwordcontroller,
                      hintText: 'password',
                      color: Color(0xFFdeaaff),
                    ),
                      SizedBox(height: 20),
                    RaisedButton(
                      
                     onPressed: (){
                        registerBloc.add(SignUpButtonPressed(email: emailcontroller.text, password: passwordcontroller.text));
                      },


                     )
                    ]
                    )
                    )
                    
          ],
        ),
      ),
    );
  }

  Widget buildError(String message) {
    return Text(message);
  }

}