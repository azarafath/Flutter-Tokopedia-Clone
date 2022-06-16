import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/product_tile_widget.dart';
import 'package:tokped/ui/widgets/skeleton_product_tile_widget.dart';

class HomeFlashSale extends StatefulWidget {
  const HomeFlashSale({Key? key}) : super(key: key);

  @override
  State<HomeFlashSale> createState() => _HomeFlashSaleState();
}

class _HomeFlashSaleState extends State<HomeFlashSale> {
  bool isLoading = true;
  Duration endTimer = const Duration(hours: 12);
  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        endTimer -= const Duration(seconds: 1);
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenHeight(30)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spesial warga Semarang',
                  style: kPrimaryTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: kBoldFontWeight,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Row(
                  children: [
                    Text(
                      'Berakhir dalam:  ',
                      style: kPrimaryTextStyle.copyWith(
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: kMediumFontWeight,
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kRedColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(8),
                              vertical: getProportionateScreenHeight(5)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                size: 15,
                                color: kWhiteColor,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              Text(
                                '${endTimer.inHours} : ${endTimer.inMinutes % 60} : ${endTimer.inSeconds % 60}',
                                style: kPrimaryTextStyle.copyWith(
                                    fontSize: getProportionateScreenWidth(12),
                                    color: kWhiteColor,
                                    fontWeight: kBoldFontWeight),
                              ),
                            ],
                          ),
                        )),
                    const Spacer(),
                    Text(
                      'Lihat semua',
                      style: kPrimaryTextStyle.copyWith(
                        fontWeight: kBoldFontWeight,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //Items
          SizedBox(height: getProportionateScreenHeight(10)),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              image: DecorationImage(
                image: AssetImage('assets/bg_flash_sale.png'),
                alignment: Alignment.centerLeft,
                // align image left
              ),
            ),
            height: getProportionateScreenHeight(280),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  width: getProportionateScreenWidth(150),
                ),
                isLoading ? skeleton() : product(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget product() {
    return Wrap(
      children: const [
        ProductTile(
          image: 'assets/product_1.png',
          price: 50000,
          discount: 75,
        ),
        ProductTile(
          image: 'assets/product_2.jpg',
          price: 100000,
          discount: 50,
        ),
        ProductTile(
          image: 'assets/product_3.jpg',
          price: 80000,
          discount: 40,
        )
      ],
    );
  }

  Widget skeleton() {
    return Wrap(
      children: const [
        SkeletonProductTile(),
        SkeletonProductTile(),
        SkeletonProductTile(),
      ],
    );
  }
}
