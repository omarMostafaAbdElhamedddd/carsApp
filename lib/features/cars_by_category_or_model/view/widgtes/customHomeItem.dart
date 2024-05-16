import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../../conts.dart';
import '../../../../utitls/resposiveSize.dart';

import '../../../splashView/view/widgets/customText.dart';
import '../../model/CarModel.dart';

class CustomItemHome extends StatelessWidget {
  const CustomItemHome({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: secondColor.withOpacity(.4),
                    spreadRadius: .01,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Image.network(
                car.imagesUrls.first,
                height: SizeConfig.screenHeight! * .13,
                width: SizeConfig.screenWidth! * .4,
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
                      height: SizeConfig.screenHeight!*.13,
                      width: SizeConfig.screenWidth!*.4,
                      child: Center(
                          child: SpinKitCircle(
                            color: kPreimaryColor,
                          )),
                    );
                  }
                },
                fit: BoxFit.cover,
              )),
          CustomHorizentalSizeBox(
            padding: .5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: car.name,
                  fontSize: 18,
                  color: Colors.black,
                ),
                CustomVerticalSizeBox(
                  padding: .3,
                ),
                CustomText(
                  text: '${car.minPrice} \$ : ${car.maxPrice}\$',
                  fontSize: 16,
                  maxLines: 2,
                ),
                CustomVerticalSizeBox(
                  padding: .3,
                ),
                CustomText(
                  text: 'Doors num : ${car.doors} ',
                  fontSize: 18,
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
