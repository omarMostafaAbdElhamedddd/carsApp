
import 'package:cars_app/conts.dart';
import 'package:cars_app/features/home/manger/getModelByVrand.dart';
import 'package:cars_app/features/home/presentation/widgets/listGetCarsBybrand&model.dart';
import 'package:cars_app/features/home/presentation/widgets/listOfCars.dart';
import 'package:cars_app/features/splashView/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/models/modelMode.dart';

class ModelsInsideBRand extends StatelessWidget {
  const ModelsInsideBRand({super.key, required this.brand});
 final String brand ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [Image.asset(logoWithKPrCokor , height: 10,)],
        backgroundColor: Colors.white,
        title: CustomText(text: 'Select model',fontSize: 18,),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: kPreimaryColor,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: FutureBuilder(
        future: GetModelByBRand.getmodelaByBRand(brand),
        builder: (context ,snabshot) {
          if(snabshot.hasData){
            return ListView.builder(
                padding: EdgeInsets.only(top: 30),
                itemBuilder:  (c,index){
                  return GestureDetector(
                    onTap: (){
                      Get.to(()=>ListOfCarsbyBrandAndModel( model:snabshot.data![index].name) ,transition: Transition.fadeIn);
                    },
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            CustomBrand(),
                            Divider(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                          child: CustomText(text: 'Model name ' , fontSize: 18,fontWeight: FontWeight.bold,),
                        )
                      ],
                    ),
                  );
                });
          }else if(snabshot.connectionState ==ConnectionState.waiting){
            return Center(child: SpinKitCircle(color: kPreimaryColor,),);

          }else{
            return Center(child: CustomText(text: 'SomeThing went wrong',),);
          }
        },
      )
    );
  }
}
class CustomBrand extends StatelessWidget {
  const CustomBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset('assets/images/carr.JPG'),
      ],
    );
  }
}

