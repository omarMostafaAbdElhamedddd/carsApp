import 'package:flutter/cupertino.dart';

import '../../../../utitls/resposiveSize.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.indexl});
final String indexl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.asset(
          'assets/images/$indexl.jpg',
          fit: BoxFit.cover,
          height: SizeConfig.screenHeight!*.2,
          width: SizeConfig.screenWidth! * .6,
        ),
      ),
    );
  }
}