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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Spesial di Tokopedia hari ini',
                  style: kPrimaryTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: kBoldFontWeight,
                  ),
                ),
                Text(
                  'Lihat semua',
                  style: kPrimaryTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(12),
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Image.asset('assets/banner_1.webp'),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Image.asset('assets/banner_2.webp'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Image.asset('assets/banner_3.webp'),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Image.asset('assets/banner_4.webp'),
                    ),
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
