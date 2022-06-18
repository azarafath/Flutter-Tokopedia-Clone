import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: getProportionateScreenWidth(104),
                height: getProportionateScreenHeight(52),
                margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(10),
                  right: getProportionateScreenWidth(8),
                  bottom: getProportionateScreenHeight(15),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(6),
                  vertical: getProportionateScreenHeight(8),
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(5)),
                      width: getProportionateScreenWidth(24),
                      height: getProportionateScreenHeight(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text(
                      'For KodingWorks',
                      style: kPrimaryTextStyle.copyWith(
                          fontWeight: kBoldFontWeight,
                          fontSize: 11,
                          color: kWhiteColor),
                    )
                  ],
                ),
              ),
              Container(
                width: getProportionateScreenWidth(104),
                height: getProportionateScreenHeight(52),
                margin: EdgeInsets.only(
                  right: getProportionateScreenWidth(8),
                  bottom: getProportionateScreenHeight(15),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(6),
                  vertical: getProportionateScreenHeight(8),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(5)),
                      width: getProportionateScreenWidth(24),
                      height: getProportionateScreenHeight(2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text(
                      'Men In Style',
                      style: kPrimaryTextStyle.copyWith(
                          fontWeight: kBoldFontWeight,
                          fontSize: 11,
                          color: kWhiteColor),
                    )
                  ],
                ),
              ),
              Container(
                width: getProportionateScreenWidth(104),
                height: getProportionateScreenHeight(52),
                margin: EdgeInsets.only(
                  right: getProportionateScreenWidth(8),
                  bottom: getProportionateScreenHeight(15),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(6),
                  vertical: getProportionateScreenHeight(8),
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(5)),
                      width: getProportionateScreenWidth(24),
                      height: getProportionateScreenHeight(2),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text(
                      'Special Discount',
                      style: kPrimaryTextStyle.copyWith(
                          fontWeight: kBoldFontWeight,
                          fontSize: 11,
                          color: kWhiteColor),
                    )
                  ],
                ),
              ),
              Container(
                width: getProportionateScreenWidth(104),
                height: getProportionateScreenHeight(52),
                margin: EdgeInsets.only(
                  right: getProportionateScreenWidth(8),
                  bottom: getProportionateScreenHeight(15),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(6),
                  vertical: getProportionateScreenHeight(8),
                ),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(5)),
                      width: getProportionateScreenWidth(24),
                      height: getProportionateScreenHeight(2),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Text(
                      'Aktivitasmu',
                      style: kPrimaryTextStyle.copyWith(
                          fontWeight: kBoldFontWeight,
                          fontSize: 11,
                          color: kWhiteColor),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
