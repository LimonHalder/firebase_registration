import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:succes_project/ui/home_screen.dart';
import 'package:succes_project/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUp2ndScreen extends StatelessWidget {

  TextEditingController namecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      body:SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
                      'Fill in the application form',
                      style: TextStyle(color: Color(0xFFbc6c25), fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.name,
                      textEditingController:namecontroller,
                      hintText: 'name',
                      color: Color(0xFFdeaaff),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.name,
                      textEditingController:countrycontroller,
                      hintText: 'country',
                      color: Color(0xFFdeaaff),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.number,
                      textEditingController: phonenumbercontroller,
                      hintText: 'phone',
                      color: Color(0xFFdeaaff),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      obscureText: false,
                      textInputType: TextInputType.name,
                      textEditingController: adresscontroller,
                      hintText: 'adress',
                      color: Color(0xFFdeaaff),
                    ),
                     
                    GestureDetector(
                      onTap: (){
                        Map<String, dynamic> data ={
                          'name' : namecontroller.text,
                          'country' :countrycontroller.text,
                          'phone' : phonenumbercontroller.text,
                          'adress' : adresscontroller.text,
                        };
                        FirebaseFirestore.instance.collection('users').add(data);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                      child: Text("Next"),
                    )
          ],
        ),
      ),
      
    );
  }
}