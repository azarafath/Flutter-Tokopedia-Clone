import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class ProductTile extends StatelessWidget {
  const ProductTile(
      {Key? key,
      required this.image,
      required this.price,
      required this.discount})
      : super(key: key);
  final String image;
  final int price;
  final int discount;

  @override
  Widget build(BuildContext context) {
    var total = price - price * discount ~/ 100;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(20),
        horizontal: getProportionateScreenWidth(5),
      ),
      height: getProportionateScreenHeight(310),
      width: getProportionateScreenWidth(140),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: getProportionateScreenHeight(8)),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: getProportionateScreenHeight(150),
            width: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 8.0, top: getProportionateScreenHeight(5)),
            child: Text(
              CurrencyFormat.convertToIdr(total, 0),
              style: kPrimaryTextStyle.copyWith(
                fontWeight: kBoldFontWeight,
                fontSize: 12,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.pink.shade50),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      '$discount%',
                      style: kPrimaryTextStyle.copyWith(
                          fontSize: 8,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                Text(
                  CurrencyFormat.convertToIdr(price, 0),
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
                  width: getProportionateScreenWidth(4),
                ),
                Text(
                  'Jakarta',
                  style: kPrimaryTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(12),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(4),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: getProportionateScreenHeight(2),
              left: getProportionateScreenWidth(4),
            ),
            child: Image.asset(
              'assets/image_freeongkir.png',
              width: getProportionateScreenWidth(50),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: double.infinity,
              height: 2,
              color: kRedColor,
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'Segera habis',
              style: kPrimaryTextStyle.copyWith(
                color: Colors.redAccent,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
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
