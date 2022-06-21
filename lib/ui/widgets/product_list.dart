import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tokped/models/product.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tileProduct(Product product) {
      var total = product.price - product.price * product.discount ~/ 100;
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: kBlackColor.withOpacity(0.1),
                offset: const Offset(0, 5),
                blurRadius: 10,
              ),
            ],
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      product.image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: getProportionateScreenHeight(172),
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: getProportionateScreenWidth(8),
                    left: getProportionateScreenHeight(8),
                    top: getProportionateScreenHeight(4)),
                child: Text(
                  product.name,
                  style: kPrimaryTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(14),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenHeight(8),
                    top: getProportionateScreenHeight(4)),
                child: Text(
                  CurrencyFormat.convertToIdr(total, 0),
                  style: kPrimaryTextStyle.copyWith(
                    fontWeight: kBoldFontWeight,
                    fontSize: getProportionateScreenWidth(12),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(8),
                    vertical: getProportionateScreenHeight(1)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.pink.shade50),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          '${product.discount}%',
                          style: kPrimaryTextStyle.copyWith(
                              fontSize: getProportionateScreenWidth(9),
                              color: Colors.pink,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(5),
                    ),
                    Text(
                      CurrencyFormat.convertToIdr(product.price, 0),
                      style: kPrimaryTextStyle.copyWith(
                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: getProportionateScreenWidth(15),
                        height: getProportionateScreenHeight(15),
                        child: Image.asset('assets/icon_pro.png')),
                    SizedBox(
                      width: getProportionateScreenWidth(2),
                    ),
                    Text(
                      product.city,
                      style: kPrimaryTextStyle.copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(6),
                  top: getProportionateScreenHeight(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rate_rounded,
                      color: Colors.yellow,
                      size: getProportionateScreenWidth(19),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(2),
                    ),
                    Text(
                      '${product.star}  | Terjual ${product.terjual}+',
                      style: kPrimaryTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: kNormalFontWeight,
                        color: const Color(0xff6D7588),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(9)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/icon_dot.png',
                      width: getProportionateScreenWidth(14),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(8),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(
        left: getProportionateScreenWidth(13),
        right: getProportionateScreenWidth(13),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              tileProduct(
                Product(
                  name: 'Sambal Ikan Segar 100gr',
                  id: 1,
                  discount: 50,
                  image: 'assets/product_1.png',
                  price: 100000,
                  city: 'Jakarta',
                  star: 4.5,
                  terjual: 100,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              tileProduct(
                Product(
                  name: 'Madu Segar Original 1 Liter',
                  id: 1,
                  discount: 40,
                  image: 'assets/product_4.jpg',
                  price: 100000,
                  city: 'Tegal',
                  star: 4.6,
                  terjual: 200,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(2),
          ),
          Row(
            children: [
              tileProduct(
                Product(
                  name: 'Qualcomm Quick Charger 3.0',
                  id: 1,
                  discount: 30,
                  image: 'assets/product_3.jpg',
                  price: 100000,
                  city: 'Semarang',
                  star: 4.9,
                  terjual: 120,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              tileProduct(
                Product(
                  name: 'Pelindung Kaca Helm All Merk',
                  id: 1,
                  discount: 80,
                  image: 'assets/product_2.jpg',
                  price: 200000,
                  city: 'Bandung',
                  star: 4.8,
                  terjual: 120,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CurrencyFormat {
  static String convertToIdr(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}
