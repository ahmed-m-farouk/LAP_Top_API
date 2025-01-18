import 'package:flutter/material.dart';

Widget defoultTextFF({
  required TextInputType type,
  required TextEditingController? controller,
  ValueChanged<String>? onchange,
  required ValueChanged<String>? onfiled,
  required FormFieldValidator<String> validat,
  String? lableText,
  String? hintText,
  required IconData? prifix,
  IconData? suffix,
  VoidCallback? suffixfunction,
  IconData? suffixIcon,
  VoidCallback? suffixIconfunction,
  bool ispasswprd = false,
  Color? color1 = const Color.fromARGB(255, 167, 165, 165),
  Color? color2 = const Color.fromARGB(255, 167, 165, 165),
}) =>
    TextFormField(
      
      keyboardType: type,
      controller: controller,
      onTap: () {},
      onChanged: onchange,
      onFieldSubmitted: onfiled, 
  validator: validat,
      obscureText: ispasswprd,
      decoration: InputDecoration(
        
        labelText: lableText,
        hintText: hintText,
        hintStyle: TextStyle(
          color: color2,
        ),
        labelStyle: TextStyle(
          color: color1,
        ),
        prefixIcon: Icon(prifix),
        suffix: IconButton(onPressed: suffixfunction, icon: Icon(suffix)),
        suffixIcon: IconButton(
          onPressed: suffixIconfunction,
          icon: Icon(suffixIcon),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
