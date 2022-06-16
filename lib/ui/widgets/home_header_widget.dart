import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/custom_clip_class.dart';

// ignore: use_key_in_widget_constructors
class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ClipPathClass(),
          child: Container(
            height: getProportionateScreenHeight(110),
            color: kPrimaryColor,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
          ),
          height: getProportionateScreenHeight(25),
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 14,
                color: kWhiteColor,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(5),
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Dikirim ke',
                    style: kPrimaryTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(11),
                      fontWeight: kNormalFontWeight,
                      color: kWhiteColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' KodingWorks',
                        style: kPrimaryTextStyle.copyWith(
                          fontSize: getProportionateScreenWidth(11),
                          fontWeight: kBoldFontWeight,
                          color: kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
              vertical: getProportionateScreenHeight(30)),
          height: getProportionateScreenHeight(48),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(7),
            ),
            // shadow bottomm only
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 1),
                blurRadius: 5,
              ),
            ],
          ),
          child: skeleton(),
        )
      ],
    );
  }

  Widget loaded() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: getProportionateScreenWidth(10),
                    left: getProportionateScreenWidth(10)),
                width: getProportionateScreenWidth(15),
                child: Image.asset('assets/gopay.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rp.1.000.000',
                    style: kPrimaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenWidth(9),
                    ),
                  ),
                  Text(
                    '2000 Coins',
                    style: kPrimaryTextStyle.copyWith(
                        fontWeight: kLightFontWeight,
                        fontSize: getProportionateScreenWidth(8)),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                width: getProportionateScreenWidth(18),
                child: Image.asset('assets/silver.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Member Silver',
                    style: kPrimaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenWidth(9),
                    ),
                  ),
                  Text(
                    '30 Kupon Baru',
                    style: kPrimaryTextStyle.copyWith(
                        fontWeight: kNormalFontWeight,
                        fontSize: getProportionateScreenWidth(8)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget skeleton() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: kLineDarkColor,
                highlightColor: kWhiteGreyColor,
                child: Container(
                  margin: EdgeInsets.only(
                      right: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(10)),
                  width: getProportionateScreenWidth(15),
                  height: getProportionateScreenHeight(15),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(4)),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(65),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(30),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: kLineDarkColor,
                highlightColor: kWhiteGreyColor,
                child: Container(
                  margin: EdgeInsets.only(
                      right: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(10)),
                  width: getProportionateScreenWidth(15),
                  height: getProportionateScreenHeight(15),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(4)),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(65),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(30),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
