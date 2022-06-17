import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokped/models/product.dart';
import 'package:tokped/providers/product_provider.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

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
                    fontSize: getProportionateScreenWidth(15),
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
                        fontSize: getProportionateScreenWidth(11),
                        fontWeight: kMediumFontWeight,
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kRedColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(6),
                              vertical: getProportionateScreenHeight(4)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.access_time_sharp,
                                size: 12,
                                color: kWhiteColor,
                              ),
                              SizedBox(
                                width: getProportionateScreenWidth(5),
                              ),
                              Text(
                                '${endTimer.inHours} : ${endTimer.inMinutes % 60} : ${endTimer.inSeconds % 60}',
                                style: kPrimaryTextStyle.copyWith(
                                    fontSize: getProportionateScreenWidth(10),
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
                        fontSize: getProportionateScreenWidth(12),
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
                FutureBuilder(
                  future: productProvider.getProducts(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      print('DATA MASOK WOY');
                      List<Product> products = snapshot.data;
                      return product(products);
                    } else {
                      return skeleton();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget product(product) {
    return Column(
      children: product.map<Widget>((product) {
        return ProductTile(
          image: product.image,
          discount: product.discount,
          price: product.price,
        );
      }).toList(),
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
