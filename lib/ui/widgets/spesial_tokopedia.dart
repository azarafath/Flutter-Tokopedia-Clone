import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class SpesialTokopedia extends StatelessWidget {
  const SpesialTokopedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: getProportionateScreenWidth(14),
            ),
            child: Text(
              'Spesial di Tokopedia hari ini',
              style: kPrimaryTextStyle.copyWith(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: kBoldFontWeight,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(118),
                    child: Image.asset('assets/banner_1.webp'),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(6),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(118),
                    child: Image.asset('assets/banner_3.webp'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(118),
                    child: Image.asset('assets/banner_2.webp'),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(6),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(118),
                    child: Image.asset('assets/banner_4.webp'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
