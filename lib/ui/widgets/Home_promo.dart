import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/product_tile_widget.dart';

import 'skeleton_product_tile_widget.dart';

class HomePromo extends StatefulWidget {
  const HomePromo({Key? key}) : super(key: key);

  @override
  State<HomePromo> createState() => _HomePromoState();
}

class _HomePromoState extends State<HomePromo> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jangan sampai kehabisan',
                style: kPrimaryTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(15),
                  fontWeight: kBoldFontWeight,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
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
              image: AssetImage('assets/bg_promo.png'),
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
              // align image left
            ),
          ),
          height: getProportionateScreenHeight(280),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                width: getProportionateScreenWidth(110),
              ),
              isLoading ? skeleton() : loaded(),
            ],
          ),
        )
      ],
    );
  }

  Widget loaded() {
    return Wrap(
      children: const [
        ProductTile(
          image: 'assets/product_4.jpg',
          price: 50000,
          discount: 75,
        ),
        ProductTile(
          image: 'assets/product_3.jpg',
          price: 100000,
          discount: 50,
        ),
        ProductTile(
          image: 'assets/product_2.jpg',
          price: 80000,
          discount: 40,
        ),
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
