import 'package:flutter/cupertino.dart';

import '../../../../utitls/resposiveSize.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/carr.JPG',
      width: SizeConfig.screenWidth! * .6,
    );
  }
}