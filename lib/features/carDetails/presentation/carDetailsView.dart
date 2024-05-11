import 'package:cars_app/conts.dart';
import 'package:cars_app/features/splashView/widgets/customText.dart';
import 'package:cars_app/utitls/resposiveSize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarDetailsView extends StatelessWidget {
  const CarDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios , color: kPreimaryColor,),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/carr.JPG'),
            Divider(color: kPreimaryColor,indent: 10,endIndent: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomVerticalSizeBox(padding: .3,),
                  Row(
                    children: [
                      CustomText(text: 'car name' , fontSize: 18,),
                      Spacer(),
                      CustomText(text: 'year' , fontSize: 18,color: secondColor,),
                    ],
                  ),
                  CustomVerticalSizeBox(padding: .6,),
                  CustomText(text: 'Price range :  From 1000 To 20000' , fontSize: 18,),
                  CustomVerticalSizeBox(padding: .6,),
                  Divider(),
                  CustomVerticalSizeBox(padding: .4,),
                  CustomText(text: 'avalible colors' , fontSize: 18,color: secondColor,),
                  CustomVerticalSizeBox(),
                  Row(
                    children: [
                      CustomText(text: 'Type : any type' , fontSize: 18,),
                      Spacer(),
                      Divider(color: Colors.red,),
                      CustomText(text: 'Model : any model'),
                    ],
                  ),
                  CustomVerticalSizeBox(padding: .6,),
                  Divider(),

                  CustomVerticalSizeBox(padding: .6,),
                  Row(
                    children: [
                      CustomText(text: 'County : any county', color: Colors.black,),
                      Spacer(),
                      CustomText(text: 'Doors numbr : 5', color: Colors.black,),
                    ],
                  ),
                  CustomVerticalSizeBox(padding: .6,),
                  Divider(),

                  CustomVerticalSizeBox(padding: .6,),
                  Row(
                    children: [
                      CustomText(text: 'powerhore: any county', color: Colors.black,),
                      Spacer(),
                      CustomText(text: 'gearBox : 5', color: Colors.black,),
                    ],
                  )



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
