
import 'package:cars_app/conts.dart';
import 'package:cars_app/features/home/manger/getModelByVrand.dart';
import 'package:cars_app/features/home/presentation/widgets/listGetCarsBybrand&model.dart';
import 'package:cars_app/features/home/presentation/widgets/listOfCars.dart';
import 'package:cars_app/features/splashView/widgets/customText.dart';
import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/models/modelMode.dart';

class ModelsInsideBRand extends StatelessWidget {
  const ModelsInsideBRand({super.key, required this.brand});
 final int brand ;
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
            print(snabshot.data![1].image);
            return ListView.builder(
              itemCount: snabshot.data!.length,
                padding: EdgeInsets.only(top: 30),
                itemBuilder:  (c,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>ListOfCarsbyBrandAndModel( modelId:snabshot.data![index].id) ,transition: Transition.fadeIn);
                      },
                      child: Stack(
                        children: [
                          Column(
                            children: [

                             Image.network(snabshot.data![index].image , height: SizeConfig.screenHeight!*.3,),
                              Divider(),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kPreimaryColor.withOpacity(.2)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                              child: CustomText(text: snabshot.data![index].name , fontSize: 18,fontWeight: FontWeight.bold,),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          }else if(snabshot.connectionState ==ConnectionState.waiting){
            return Center(child: SpinKitCircle(color: kPreimaryColor,),);

          }else{
            print(snabshot.error);
            return Center(child: CustomText(text: 'SomeThing went wrong',),);
          }
        },
      )
    );
  }
}
class CustomBrand extends StatelessWidget {
  const CustomBrand({super.key, required this.image});
 final String image ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.network(image),
      ],
    );
  }
}

