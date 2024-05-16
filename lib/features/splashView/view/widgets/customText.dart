import 'package:cars_app/conts.dart';
import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key, required this.text, this.color = kPreimaryColor, this.fontWeight = FontWeight
          .normal, this.height = 1.2,this.textDecoration=TextDecoration.none, this.fontSize = 16 , this.maxLines=1, this.textAlign=TextAlign.start});

  final String text;
 final TextAlign textAlign ;
  final double fontSize;

  final Color color;
  final TextDecoration textDecoration ;
  final FontWeight fontWeight;
 final int maxLines;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(text,
overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(

        decoration: textDecoration,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height
      ),


    );
  }
}
