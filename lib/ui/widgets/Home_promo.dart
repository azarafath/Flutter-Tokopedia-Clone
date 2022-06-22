import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokped/models/product.dart';
import 'package:tokped/providers/product_provider.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/product_tile_widget.dart';
import 'package:tokped/ui/widgets/skeleton_product_tile_widget.dart';

class HomePromo extends StatelessWidget {
  const HomePromo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
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
          height: getProportionateScreenHeight(350),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                width: getProportionateScreenWidth(130),
              ),
              FutureBuilder<List<Product>?>(
                future: productProvider.getProducts(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = snapshot.data;
                    return product(products);
                  } else {
                    return skeleton();
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget product(products) {
    return Wrap(
      children: products
          .map<Widget>(
            (e) => ProductTile(
              image: e.image,
              price: e.price,
              discount: e.discount,
            ),
          )
          .toList(),
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
