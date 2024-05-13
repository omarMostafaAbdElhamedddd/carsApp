import 'package:cars_app/conts.dart';
import 'package:cars_app/features/carDetails/presentation/carDetailsView.dart';
import 'package:cars_app/features/home/manger/getAllbrands.dart';
import 'package:cars_app/features/home/presentation/widgets/customHomeItem.dart';
import 'package:cars_app/features/home/presentation/widgets/listGetCarsBybrand&model.dart';
import 'package:cars_app/features/home/presentation/widgets/listOfCars.dart';
import 'package:cars_app/features/home/presentation/widgets/video.dart';
import 'package:cars_app/features/modelsInsideBrand/presentation/modelsInsideBrand.dart';
import 'package:cars_app/features/splashView/widgets/customText.dart';
import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeConfig.screenHeight! * .2),
        child: Container(
          padding: EdgeInsets.only(bottom: 16 , right: 12 ,left: 16),
          height: SizeConfig.screenHeight! * .14,
          decoration: BoxDecoration(
              color: kPreimaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset(
                logo,
                height: 50,
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(IconlyLight.search , color: Colors.white,size: 32,))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomVerticalSizeBox(padding:1.4,),
            VideoScreen(),
            CustomVerticalSizeBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomVerticalSizeBox(padding: .4,),

                Row(
                  children: [
                    CustomHorizentalSizeBox(padding: .3,),
                    CustomText(text: 'All Categories' , fontWeight: FontWeight.bold,fontSize: 20,),
                    Spacer(),
                    CustomText(text: 'See more' , fontSize: 18,),
                    Icon(Icons.arrow_forward_ios_sharp, size: 16,),
                    CustomHorizentalSizeBox(padding: .1,),
                  ],
                ),
                  CustomVerticalSizeBox(padding: .5,),
                FutureBuilder(future: GetAllBrandAndCategoreis.getallCategoteis(),
                    builder: (context, sn){
                      if(sn.connectionState ==ConnectionState.waiting){
                        return SizedBox(
                          height: SizeConfig.screenHeight!*.3,
                          child:  Center(child: SpinKitCircle(color: kPreimaryColor,),),
                        );
                      }else if(sn.hasData){
                        return    SizedBox(
                          height: SizeConfig.screenHeight!*.3,
                          child: ListView.builder(
                              itemCount: sn.data!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index){
                                return  GestureDetector(
                                    onTap: (){
                                      Get.to(()=>ListOfCarsbyBrandAndModel( modelId:sn.data![index].id) ,transition: Transition.fadeIn);
                                    },
                                    child: Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 30),
                                          child: CustomCategoryItem(),
                                        ),
                                        Container(
                                            padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: kPreimaryColor.withOpacity(.2)
                                            ),
                                            child: CustomText(text: sn.data![index].name , color: secondColor,))
                                      ],
                                    ));
                              }),
                        );
                      }else{
                        return SizedBox(
                          height: SizeConfig.screenHeight!*.3,
                          child: Center(child: SpinKitCircle(color: Colors.red,),),
                        );
                      }
                    }),

               CustomVerticalSizeBox(padding: .5,),

                Row(
                  children: [
                    CustomHorizentalSizeBox(padding: .2,),
                    CustomText(text: 'All Brands' , fontWeight: FontWeight.bold,fontSize: 20,),
                    Spacer(),
                    CustomText(text: 'See more', fontSize: 18,),
                    Icon(Icons.arrow_forward_ios_sharp, size: 16,),
                    CustomHorizentalSizeBox(padding: .1,),
                  ],
                ),
             CustomVerticalSizeBox(padding: .5,),
             FutureBuilder(future: GetAllBrandAndCategoreis.getallBRands(),
                 builder: (context, sn){
               if(sn.connectionState ==ConnectionState.waiting){
                 return SizedBox(
                   height: SizeConfig.screenHeight!*.3,
                   child:  Center(child: SpinKitCircle(color: kPreimaryColor,),),
                 );
               }else if(sn.hasData){
                 return    SizedBox(
                   height: SizeConfig.screenHeight!*.3,
                   child: ListView.builder(
                       itemCount: sn.data!.length,
                       scrollDirection: Axis.horizontal,
                       itemBuilder: (context, index){
                         return  GestureDetector(
                             onTap: (){
                               Get.to(()=>ModelsInsideBRand(brand: sn.data![index].id,) ,transition: Transition.fade);
                             },
                             child: Stack(
                               alignment: Alignment.topLeft,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 30),
                                   child: CustomCategoryItem(),
                                 ),
                                 Container(
                                   padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 4),
                                     decoration: BoxDecoration(
                                       borderRadius: BorderRadius.circular(8),
                                     color: kPreimaryColor.withOpacity(.2)
                                     ),
                                     child: CustomText(text: sn.data![index].name , color: secondColor,))
                               ],
                             ));
                       }),
                 );
               }else{
                 return SizedBox(
                   height: SizeConfig.screenHeight!*.3,
                   child: Center(child: SpinKitCircle(color: Colors.red,),),
                 );
               }
                 }),
                CustomVerticalSizeBox(),
              ],
            )
          ],
        ),
      )

    );
  }
}



class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/carr.JPG',width: SizeConfig.screenWidth!*.6,);
  }
}
