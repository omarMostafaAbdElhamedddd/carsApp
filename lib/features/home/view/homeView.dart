import 'package:cars_app/conts.dart';
import 'package:cars_app/features/home/view/widgets/categryAndBrandItem.dart';
import 'package:cars_app/features/home/view/widgets/video.dart';

import 'package:cars_app/features/seaech/view/search_view.dart';

import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';
import '../../cars_by_category_or_model/view/cars_by_category.dart';
import '../../models_inside_brand/view/models_inside_brand_view.dart';
import '../../splashView/view/widgets/customText.dart';
import '../presenter/getAllbrands.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: CustomText(text: 'Drawer',),
        ),
      ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeConfig.screenHeight! * .2),
          child: Container(
            padding: EdgeInsets.only(bottom: 16, right: 12, left: 0),
            height: SizeConfig.screenHeight! * .14,
            decoration: BoxDecoration(
                // color: kPreimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  logoWithKPrCokor,
                  height: 50,
                ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Get.to(()=> SearchView(), transition: Transition.zoom);
                    },
                    icon: Icon(
                      IconlyLight.search,
                      color: kPreimaryColor,
                      size: 32,
                    )),

              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomVerticalSizeBox(
                padding: 1.4,
              ),
              VideoScreen(),
              CustomVerticalSizeBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomVerticalSizeBox(
                    padding: .4,
                  ),
                  Row(
                    children: [
                      CustomHorizentalSizeBox(
                        padding: .3,
                      ),
                      CustomText(
                        text: 'All Categories',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      Spacer(),
                      CustomText(
                        text: 'See more',
                        fontSize: 18,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                      ),
                      CustomHorizentalSizeBox(
                        padding: .1,
                      ),
                    ],
                  ),
                  CustomVerticalSizeBox(
                    padding: .5,
                  ),
                  FutureBuilder(
                      future: GetAllBrandAndCategoreis.getallCategoteis(),
                      builder: (context, sn) {
                        if (sn.connectionState == ConnectionState.waiting) {
                          return SizedBox(
                            height: SizeConfig.screenHeight! * .3,
                            child: Center(
                              child: SpinKitCircle(
                                color: kPreimaryColor,
                              ),
                            ),
                          );
                        } else if (sn.hasData) {
                          return SizedBox(
                            height: SizeConfig.screenHeight! * .3,
                            child: ListView.builder(
                                itemCount: sn.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Get.to(

                                            () => ListOfCarsbycategory(
                                                  categryId: sn.data![index].id,
                                                ),
                                            transition: Transition.fadeIn);
                                      },
                                      child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: CustomCategoryItem(indexl: (index+1).toString()),
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 4),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: kPreimaryColor
                                                      .withOpacity(.2)),
                                              child: CustomText(
                                                text: sn.data![index].name,
                                                color: secondColor,
                                              ))
                                        ],
                                      ));
                                }),
                          );
                        } else {
                          return SizedBox(
                            height: SizeConfig.screenHeight! * .3,
                            child: Center(
                              child: SpinKitCircle(
                                color: Colors.red,
                              ),
                            ),
                          );
                        }
                      }),
                  CustomVerticalSizeBox(
                    padding: .5,
                  ),
                  Row(
                    children: [
                      CustomHorizentalSizeBox(
                        padding: .2,
                      ),
                      CustomText(
                        text: 'All Brands',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      Spacer(),
                      CustomText(
                        text: 'See more',
                        fontSize: 18,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 16,
                      ),
                      CustomHorizentalSizeBox(
                        padding: .1,
                      ),
                    ],
                  ),
                  CustomVerticalSizeBox(
                    padding: .5,
                  ),
                  FutureBuilder(
                      future: GetAllBrandAndCategoreis.getallBRands(),
                      builder: (context, sn) {
                        if (sn.connectionState == ConnectionState.waiting) {
                          return SizedBox(
                            height: SizeConfig.screenHeight! * .3,
                            child: Center(
                              child: SpinKitCircle(
                                color: kPreimaryColor,
                              ),
                            ),
                          );
                        } else if (sn.hasData) {
                          return SizedBox(
                            height: SizeConfig.screenHeight! * .3,
                            child: ListView.builder(
                                itemCount: sn.data!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Get.to(
                                            () => ModelsInsideBRand(
                                                  brand: sn.data![index].id,
                                                ),
                                            transition: Transition.fade);
                                      },
                                      child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: CustomCategoryItem(indexl: (index+4).toString(),),
                                          ),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 4),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: kPreimaryColor
                                                      .withOpacity(.2)),
                                              child: CustomText(
                                                text: sn.data![index].name,
                                                color: secondColor,
                                              ))
                                        ],
                                      ));
                                }),
                          );
                        } else {
                          return SizedBox(
                            height: SizeConfig.screenHeight! * .3,
                            child: Center(
                              child: SpinKitCircle(
                                color: Colors.red,
                              ),
                            ),
                          );
                        }
                      }),
                  CustomVerticalSizeBox(),
                ],
              )
            ],
          ),
        ));
  }
}


