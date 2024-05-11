import 'package:cars_app/conts.dart';
import 'package:cars_app/features/home/manger/getCarsbyCategoryOrVrand.dart';
import 'package:cars_app/features/splashView/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../../../carDetails/presentation/carDetailsView.dart';
import 'customHomeItem.dart';

class ListOfCarsbycategory extends StatelessWidget {
  const ListOfCarsbycategory({super.key,required this.category});
   final String category ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Image.asset(logoWithKPrCokor)],
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios, color: kPreimaryColor,),),
      ),
      body:FutureBuilder(
        future: GetCarsByBrandOrCatergory.getCarsByCatergory(category),
        builder: (context,state){

          if(state.connectionState == ConnectionState.waiting){
            return Center(child: SpinKitCircle(color: kPreimaryColor,),);
          }else if(state.hasData){
            return  ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(() => CarDetailsView(),
                            transition: Transition.circularReveal);
                      },
                      child: CustomItemHome());
                });
          }else{
            return Center(child: CustomText(text: 'SomeThing went wrong',),);
          }
        },
      )
    );
  }
}
