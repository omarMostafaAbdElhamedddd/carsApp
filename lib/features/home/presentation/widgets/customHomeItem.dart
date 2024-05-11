import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../conts.dart';
import '../../../../utitls/resposiveSize.dart';
import '../../../splashView/widgets/customText.dart';

class CustomItemHome extends StatelessWidget {
  const CustomItemHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 30 , horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow:[
                  BoxShadow(
                    color: secondColor.withOpacity(.4),
                    spreadRadius: .01,
                    blurRadius: 1,
                  ),
                ],
              ),

              child: Image.asset('assets/images/carr.JPG' , height: SizeConfig.screenHeight!*.13,)),
          CustomHorizentalSizeBox(padding: .5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'car name ' , fontSize: 18,color: Colors.black,),
              CustomVerticalSizeBox(padding: .3,),
              CustomText(text: 'From${1900} To ${2000}\$' , fontSize: 18,),
              CustomVerticalSizeBox(padding: .3,),
              CustomText(text: 'Doors num :3 ' , fontSize: 18,color: Colors.black,),
            ],)
        ],
      ),
    );
  }
}