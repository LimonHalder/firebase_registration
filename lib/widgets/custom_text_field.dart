import 'package:succes_project/ui/valiator.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Color color;
  final TextInputType textInputType;
  final bool obscureText;
  final String validator;
  const CustomTextField({
    Key key,
    this.hintText,
    this.textEditingController,
    this.color,
    this.textInputType,
    this.obscureText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
      ),
      padding: EdgeInsets.all(5.0),
      height: 65,
      child: TextField(
        obscureText: obscureText,
        controller: textEditingController,
        keyboardType: textInputType,
     
        decoration: InputDecoration(
         
          hintText: hintText,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          errorStyle: TextStyle(color: Colors.white),
          filled: true,
        ),
      ),
    );
  }
}