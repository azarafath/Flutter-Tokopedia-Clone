import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:tokped/models/product.dart';
import 'package:tokped/services/product_service.dart';
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
  late List<Product>? _products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  _getProducts() async {
    _products = await ProductService().getProduct();
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
                              TimerCountdown(
                                format:
                                    CountDownTimerFormat.hoursMinutesSeconds,
                                endTime: DateTime.now().add(
                                  const Duration(
                                    hours: 12,
                                  ),
                                ),
                              )
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
                _products == null || _products!.isEmpty
                    ? skeleton()
                    : ListView.builder(
                        itemCount: _products!.length,
                        itemBuilder: (context, index) {
                          return ProductTile(
                            discount: _products![index].discount,
                            image: _products![index].image,
                            price: _products![index].price,
                          );
                        },
                      )
              ],
            ),
          )
        ],
      ),
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
