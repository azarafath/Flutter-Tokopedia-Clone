import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(60),
      decoration: const BoxDecoration(
        color: kWhiteColor,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: kPrimaryTextStyle.copyWith(
            fontSize: getProportionateScreenWidth(12)),
        selectedItemColor: kBlackColor,
        unselectedItemColor: kBlackColor,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Container(
              margin: EdgeInsets.only(bottom: getProportionateScreenHeight(2)),
              height: getProportionateScreenHeight(20),
              child: Image.asset('assets/nav-icon/icon_home.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Feed',
            icon: Container(
              margin: EdgeInsets.only(bottom: getProportionateScreenHeight(2)),
              height: getProportionateScreenHeight(20),
              child: Image.asset('assets/nav-icon/icon_feed.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Official Store',
            icon: Container(
              margin: EdgeInsets.only(bottom: getProportionateScreenHeight(2)),
              height: getProportionateScreenHeight(20),
              child: Image.asset('assets/nav-icon/icon_official_store.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Wishlist',
            icon: Container(
              margin: EdgeInsets.only(bottom: getProportionateScreenHeight(2)),
              height: getProportionateScreenHeight(20),
              child: Image.asset('assets/nav-icon/icon_wishlist.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Transaksi',
            icon: Container(
              margin: EdgeInsets.only(bottom: getProportionateScreenHeight(2)),
              height: getProportionateScreenHeight(20),
              child: Image.asset('assets/nav-icon/icon_transaksi.png'),
            ),
          ),
        ],
      ),
    );
  }
}
