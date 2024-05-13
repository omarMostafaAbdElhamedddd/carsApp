
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../conts.dart';
import '../../../carDetails/presentation/carDetailsView.dart';
import '../../../splashView/widgets/customText.dart';
import '../../manger/getCarsbyCategoryOrVrand.dart';
import 'customHomeItem.dart';

class ListOfCarsbyBrandAndModel extends StatelessWidget {
  const ListOfCarsbyBrandAndModel({super.key,required this.modelId});

  final int modelId;
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
          future: GetCarsByBrandOrCatergory.getCarsByModel(modelId),
          builder: (context,state){

            if(state.connectionState == ConnectionState.waiting){
              return Center(child: SpinKitCircle(color: kPreimaryColor,),);
            }else if(state.hasData){
              return  ListView.builder(
                itemCount: state.data!.length,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(() => CarDetailsView(car:state.data![index],),
                              transition: Transition.circularReveal);
                        },
                        child: CustomItemHome(car: state.data![index],));
                  });
            }else{
              return Center(child: CustomText(text: 'SomeThing went wrong',),);
            }
          },
        )
    );
  }
}
