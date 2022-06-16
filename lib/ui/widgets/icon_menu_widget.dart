import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({Key? key, required this.label, required this.image})
      : super(key: key);
  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 50,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(image),
            ),
          ),
          Text(
            label,
            style: kPrimaryTextStyle.copyWith(
              fontWeight: kMediumFontWeight,
              fontSize: getProportionateScreenWidth(10),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
