import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class DealsHariIni extends StatelessWidget {
  const DealsHariIni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pilihan Deals Hari Ini',
                  style: kPrimaryTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: kBoldFontWeight,
                  ),
                ),
                Text(
                  'Lihat semua',
                  style: kPrimaryTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(12),
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(16),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(
                      10,
                    )),
                    width: getProportionateScreenWidth(152),
                    height: getProportionateScreenHeight(252),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.tokopedia.net/img/SuMXtx/2022/6/24/b2bbf803-748c-4f02-a1e4-b50b0374341e.png',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(
                      10,
                    )),
                    width: getProportionateScreenWidth(152),
                    height: getProportionateScreenHeight(252),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.tokopedia.net/img/SuMXtx/2022/6/20/b8f0972a-5772-459a-8985-d1084b0f6659.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(
                      10,
                    )),
                    width: getProportionateScreenWidth(152),
                    height: getProportionateScreenHeight(252),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.tokopedia.net/img/SuMXtx/2022/6/22/c09f653b-bc10-4c65-aa54-2a189ab6d8e0.jpg',
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(
                      10,
                    )),
                    width: getProportionateScreenWidth(152),
                    height: getProportionateScreenHeight(252),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                      image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.tokopedia.net/img/SuMXtx/2022/6/22/004fedff-7bd6-4159-b6ae-6fb440db6c9f.jpg?ect=4g',
                          ),
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
