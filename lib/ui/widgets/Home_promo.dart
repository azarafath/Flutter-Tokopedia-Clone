import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/product_tile_widget.dart';

class HomePromo extends StatelessWidget {
  const HomePromo({Key? key}) : super(key: key);

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
              const ProductTile(
                image: 'assets/product_4.jpg',
                price: 50000,
                discount: 75,
              ),
              const ProductTile(
                image: 'assets/product_3.jpg',
                price: 100000,
                discount: 50,
              ),
              const ProductTile(
                image: 'assets/product_2.jpg',
                price: 80000,
                discount: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
