
import 'package:flutter/material.dart';

import '../../../../../conts.dart';


class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({super.key , this.label='' ,this.controller ,this.textInputType=TextInputType.text});
  final String label ;
  final TextInputType textInputType ;
 final TextEditingController? controller ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
            fontSize: 12
        ),

        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
          color: kPreimaryColor,
        )),
      ),
    );
  }
}