import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget category(String image, String title) {
      return Container(
        margin: EdgeInsets.only(
          right: getProportionateScreenWidth(10),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(10),
          ),
          border: Border.all(
            color: Colors.grey,
            width: getProportionateScreenWidth(0.5),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: getProportionateScreenWidth(110),
              height: getProportionateScreenHeight(92),
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
            ),
            SizedBox(
              height: getProportionateScreenHeight(27),
              child: Text(
                title,
                style: kPrimaryTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(11),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: getProportionateScreenWidth(16),
            ),
            child: Text(
              'Kategori Pilihan',
              style: kPrimaryTextStyle.copyWith(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: kBoldFontWeight,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          category(
                            'assets/categori_1.png',
                            'Buku',
                          ),
                          category(
                            'assets/categori_2.png',
                            'Dapur',
                          ),
                          category(
                            'assets/categori_3.png',
                            'Fashion Anak',
                          ),
                          category(
                            'assets/categori_4.png',
                            'Rumah Tangga',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: getProportionateScreenWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          category(
                            'assets/categori_5.png',
                            'Elektronik',
                          ),
                          category(
                            'assets/categori_6.png',
                            'Kamera',
                          ),
                          category(
                            'assets/categori_7.png',
                            'Makanan',
                          ),
                          category(
                            'assets/categori_8.png',
                            'Smartphone',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
