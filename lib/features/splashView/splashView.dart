
import 'package:cars_app/conts.dart';

import 'package:cars_app/features/splashView/widgets/customText.dart';
import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../auth/signIn/presenation/signInView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2) ,(){
      Get.to(()=>SignInView() , transition: Transition.zoom);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPreimaryColor,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        CustomVerticalSizeBox(),
          Image.asset(logo),
          Spacer(),
          Image.asset('assets/images/car.JPG'),
          Spacer(flex: 6,),

          GestureDetector(
            onTap: (){
              Get.to(()=>SignInView(), transition: Transition.zoom);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30 , ),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child:CustomText(text: 'Get Started',color: secondColor,fontWeight: FontWeight.bold,fontSize: 20,)),
            ),
          ),
          Spacer(flex: 4,),

        ],
      ) ,
    );
  }
}
