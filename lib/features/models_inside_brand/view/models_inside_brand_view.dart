import 'package:cars_app/conts.dart';
import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconly/iconly.dart';

import '../../cars_by_category_or_model/view/cars_by_model.dart';
import '../../home/models/modelModel.dart';

import '../../splashView/view/widgets/customText.dart';
import '../presenter/presenterModel.dart';

class ModelsInsideBRand extends StatelessWidget {
  const ModelsInsideBRand({super.key, required this.brand});

  final int brand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: CustomText(
            text: 'Select model',
            fontSize: 18,
          ),
          leading: IconButton(
            icon: Icon(
              IconlyLight.arrow_left,
              color: kPreimaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: FutureBuilder(
          future: GetModelsByBRand.getmodelsByBRand(brand),
          builder: (context, snabshot) {
            if (snabshot.hasData) {
              return ListView.builder(
                  itemCount: snabshot.data!.length,
                  padding: EdgeInsets.only(top: 30),
                  itemBuilder: (c, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                              () => carsByModel(
                                    modelId: brand,
                                  ),
                              transition: Transition.fadeIn);
                        },
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    snabshot
                                        .data![index == 0 &&
                                                    snabshot.data!.length == 3 ||
                                                snabshot.data!.length == 2
                                            ? 1
                                            : index]
                                        .image,
                                    loadingBuilder: (BuildContext context, Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      } else {
                                        double? progress =
                                        loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                            : null;
                                        return SizedBox(
                                          height: SizeConfig.screenHeight! * .3,
                                          child: Center(
                                              child: SpinKitCircle(
                                                color: kPreimaryColor,
                                              )),
                                        );
                                      }
                                    },
                                    height: SizeConfig.screenHeight! * .3,
                                    width: SizeConfig.screenWidth,
                                    fit: BoxFit.fill,

                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: kPreimaryColor.withOpacity(.2)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: CustomText(
                                  text: snabshot.data![index].name,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else if (snabshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitCircle(
                  color: kPreimaryColor,
                ),
              );
            } else {
              print(snabshot.error);
              return Center(
                child: CustomText(
                  text: 'SomeThing went wrong',
                ),
              );
            }
          },
        ));
  }
}
