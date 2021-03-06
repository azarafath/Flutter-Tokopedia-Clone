import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tokped/models/balance.dart';
import 'package:tokped/providers/balance_provider.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/custom_clip_class.dart';
import 'package:intl/intl.dart';

// ignore: use_key_in_widget_constructors
class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BalanceProvider balanceProvider = Provider.of<BalanceProvider>(context);
    return Stack(
      children: [
        ClipPath(
          clipper: ClipPathClass(),
          child: Container(
            height: getProportionateScreenHeight(92),
            color: kPrimaryColor,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(16),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/icon_location.png',
                width: getProportionateScreenWidth(14),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: getProportionateScreenWidth(5),
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Dikirim ke',
                    style: kPrimaryTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(11),
                      fontWeight: kNormalFontWeight,
                      color: kWhiteColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' KodingWorks',
                        style: kPrimaryTextStyle.copyWith(
                          fontSize: getProportionateScreenWidth(11),
                          fontWeight: kBoldFontWeight,
                          color: kWhiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: getProportionateScreenWidth(4)),
                child: Image.asset(
                  'assets/icon_arrow_down.png',
                  color: kWhiteColor,
                  width: getProportionateScreenWidth(8),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: getProportionateScreenWidth(16),
            right: getProportionateScreenWidth(16),
            top: getProportionateScreenHeight(28),
          ),
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(11),
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(
              getProportionateScreenWidth(7),
            ),
            // shadow bottomm only
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 1),
                blurRadius: 5,
              ),
            ],
          ),
          child: FutureBuilder<List<Balance>?>(
            future: balanceProvider.getBalance(),
            builder: (context, snapshoot) {
              if (snapshoot.hasData) {
                List<Balance> data = snapshoot.data!;
                return loaded(data[0]);
              } else {
                return skeleton();
              }
            },
          ),
        )
      ],
    );
  }

  Widget loaded(Balance balance) {
    final currencyFormatter = NumberFormat('#,##0', 'ID');

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: getProportionateScreenWidth(10),
                    left: getProportionateScreenWidth(10)),
                width: getProportionateScreenWidth(15),
                child: Image.asset('assets/gopay.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    CurrencyFormat.convertToIdr(balance.gopay, 0),
                    style: kPrimaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenWidth(9),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(2),
                  ),
                  Text(
                    '${currencyFormatter.format(balance.coins)} Coins',
                    style: kPrimaryTextStyle.copyWith(
                      color: Colors.grey,
                      fontWeight: kLightFontWeight,
                      fontSize: getProportionateScreenWidth(9),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                width: getProportionateScreenWidth(18),
                child: Image.asset('assets/silver.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Member Silver',
                    style: kPrimaryTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: getProportionateScreenWidth(9),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(2),
                  ),
                  Text(
                    '${balance.voucher} Kupon Baru',
                    style: kPrimaryTextStyle.copyWith(
                      color: Colors.grey,
                      fontWeight: kLightFontWeight,
                      fontSize: getProportionateScreenWidth(9),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget skeleton() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: kLineDarkColor,
                highlightColor: kWhiteGreyColor,
                child: Container(
                  margin: EdgeInsets.only(
                      right: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(10)),
                  width: getProportionateScreenWidth(15),
                  height: getProportionateScreenHeight(15),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(4)),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(65),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(30),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Shimmer.fromColors(
                baseColor: kLineDarkColor,
                highlightColor: kWhiteGreyColor,
                child: Container(
                  margin: EdgeInsets.only(
                      right: getProportionateScreenWidth(10),
                      left: getProportionateScreenWidth(10)),
                  width: getProportionateScreenWidth(15),
                  height: getProportionateScreenHeight(15),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: getProportionateScreenHeight(4)),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(65),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: kLineDarkColor,
                    highlightColor: kWhiteGreyColor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(20),
                        ),
                      ),
                      width: getProportionateScreenWidth(30),
                      height: getProportionateScreenHeight(8),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
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
