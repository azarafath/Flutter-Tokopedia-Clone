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
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: getProportionateScreenWidth(58),
      child: Column(
        children: [
          Container(
            width: getProportionateScreenWidth(40),
            height: getProportionateScreenHeight(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Image.asset(image),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(5),
            ),
            child: Text(
              label,
              style: kPrimaryTextStyle.copyWith(
                fontWeight: kMediumFontWeight,
                fontSize: getProportionateScreenWidth(9),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
