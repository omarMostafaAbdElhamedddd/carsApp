import 'package:cars_app/conts.dart';

import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';

import '../../cars_by_category_or_model/model/CarModel.dart';
import '../../splashView/view/widgets/customText.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key, required this.car});

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            IconlyLight.arrow_left,
            color: kPreimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * .3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: car.imagesUrls.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          car.imagesUrls[index],
                          width: SizeConfig.screenWidth! * .7,
                          fit: BoxFit.cover,
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
                                height: SizeConfig.screenHeight!*.3,
                                width: SizeConfig.screenWidth! * .7,
                                child: Center(
                                    child: SpinKitCircle(
                                  color: kPreimaryColor,
                                )),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  }),
            ),
            CustomVerticalSizeBox(
              padding: .6,
            ),
            Divider(
              color: kPreimaryColor,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomVerticalSizeBox(
                    padding: .3,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: car.name,
                        fontSize: 18,
                      ),
                      Spacer(),
                      CustomText(
                        text: car.year.toString(),
                        fontSize: 18,
                        color: secondColor,
                      ),
                    ],
                  ),
                  CustomVerticalSizeBox(
                    padding: .7,
                  ),
                  CustomText(
                    text:
                        'Price range :  From ${car.minPrice} To ${car.maxPrice}',
                    fontSize: 18,
                  ),
                  CustomVerticalSizeBox(
                    padding: .6,
                  ),
                  Divider(),
                  CustomVerticalSizeBox(
                    padding: .4,
                  ),
                  CustomText(
                    text: 'avalible colors',
                    fontSize: 18,
                    color: secondColor,
                  ),
                  CustomVerticalSizeBox(
                    padding: .4,
                  ),
                  SizedBox(
                    height: 20,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        itemCount: car.colors.length,
                        itemBuilder: (context, index) {
                          return CustomText(text: car.colors[index]);
                        }),
                  ),
                  CustomVerticalSizeBox(),
                  Row(
                    children: [
                      CustomText(
                        text: 'Type : ${car.carType}',
                        fontSize: 18,
                      ),
                      Spacer(),
                      Divider(
                        color: Colors.red,
                      ),
                      CustomText(text: 'Model : ${car.model}'),
                    ],
                  ),
                  CustomVerticalSizeBox(
                    padding: .6,
                  ),
                  Divider(),
                  CustomVerticalSizeBox(
                    padding: .6,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'County : ${car.country}',
                        color: Colors.black,
                      ),
                      Spacer(),
                      CustomText(
                        text: 'Doors numbr : ${car.doors}',
                        color: Colors.black,
                      ),
                    ],
                  ),
                  CustomVerticalSizeBox(
                    padding: .6,
                  ),
                  Divider(),
                  CustomVerticalSizeBox(
                    padding: .6,
                  ),
                  CustomText(
                    text: 'powerhore: ${car.powerHorse}',
                    color: Colors.black,
                  ),
                  CustomVerticalSizeBox(
                    padding: .4,
                  ),
                  CustomText(
                    text: 'gearBox : ${car.gearBox}',
                    color: Colors.black,
                    maxLines: 3,
                  ),
                  CustomVerticalSizeBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
