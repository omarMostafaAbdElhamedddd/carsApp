import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../conts.dart';
import '../../../../utitls/resposiveSize.dart';
import '../../../carDetails/view/carDetailsView.dart';
import '../../../cars_by_category_or_model/model/CarModel.dart';
import '../../../splashView/view/widgets/customText.dart';



class CustomItemSearch extends StatelessWidget {
  const CustomItemSearch({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: (){
        Get.to(()=>CarDetailsView(car: car) , transition:  Transition.zoom);
      },
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: .5,
                      blurRadius: 1,
                      //offset: Offset(0, 3), // changes position of shadow
                    )
                  ]),
              child: Image.network(
                car.imagesUrls.first,
                height: SizeConfig.screenHeight! * .14,
                width: SizeConfig.screenWidth! * .3,
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
                      height: SizeConfig.screenHeight! * .14,
                      width: SizeConfig.screenWidth! * .3,
                      child: Center(
                          child: SpinKitCircle(
                            color: kPreimaryColor,
                          )),
                    );
                  }
                },
              )),
          CustomHorizentalSizeBox(
            padding: .5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: car.name),
              CustomVerticalSizeBox(
                padding: .2,
              ),
              CustomText(text: car.model),
              CustomVerticalSizeBox(
                padding: .2,
              ),
              CustomText(
                text: '${car.minPrice}\$ : ${car.maxPrice}\$ ',
                color: Colors.brown,
              ),
            ],
          )
        ],
      ),
    );
  }
}