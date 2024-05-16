import 'package:flutter/cupertino.dart';

class CustomBrand extends StatelessWidget {
  const CustomBrand({super.key, required this.image});
  final String image ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.network(image),
      ],
    );
  }
}
