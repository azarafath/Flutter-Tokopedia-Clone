import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class SkeletonProductTile extends StatelessWidget {
  const SkeletonProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: getProportionateScreenWidth(5),
      ),
      height: getProportionateScreenHeight(260),
      width: getProportionateScreenWidth(120),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: kLineDarkColor,
            highlightColor: kWhiteGreyColor,
            child: Container(
              margin: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
              decoration: const BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              height: getProportionateScreenHeight(130),
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: kLineDarkColor,
                  highlightColor: kWhiteGreyColor,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink.shade50),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SizedBox(
                        width: getProportionateScreenWidth(16),
                        height: getProportionateScreenHeight(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                Shimmer.fromColors(
                  baseColor: kLineDarkColor,
                  highlightColor: kWhiteGreyColor,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor,
                    ),
                    width: getProportionateScreenWidth(55),
                    height: getProportionateScreenHeight(8),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(9),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Shimmer.fromColors(
                baseColor: kLineDarkColor,
                highlightColor: kWhiteGreyColor,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhiteColor,
                  ),
                  width: getProportionateScreenWidth(60),
                  height: getProportionateScreenHeight(15),
                ),
              )),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Shimmer.fromColors(
                  baseColor: kLineDarkColor,
                  highlightColor: kWhiteGreyColor,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kWhiteColor,
                    ),
                    width: getProportionateScreenWidth(15),
                    height: getProportionateScreenHeight(15),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(2),
                ),
                Shimmer.fromColors(
                  baseColor: kLineDarkColor,
                  highlightColor: kWhiteGreyColor,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor,
                    ),
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(8),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Shimmer.fromColors(
              baseColor: kLineDarkColor,
              highlightColor: kWhiteGreyColor,
              child: Container(
                width: double.infinity,
                height: 2,
                color: kWhiteColor,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Shimmer.fromColors(
              baseColor: kLineDarkColor,
              highlightColor: kWhiteGreyColor,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kWhiteColor,
                ),
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenHeight(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
