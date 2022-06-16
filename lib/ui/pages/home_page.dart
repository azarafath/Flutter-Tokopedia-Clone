import 'package:float_bubble/float_bubble.dart';
import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/Home_promo.dart';
import 'package:tokped/ui/widgets/custom_navigation_bar_widget.dart';
import 'package:tokped/ui/widgets/home_category.dart';
import 'package:tokped/ui/widgets/home_flash_sale.dart';
import 'package:tokped/ui/widgets/home_header_widget.dart';
import 'package:tokped/ui/widgets/home_menu.dart';
import 'package:tokped/ui/widgets/spesial_tokopedia.dart';
import 'package:curved_animation_controller/curved_animation_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollViewController = ScrollController();
  late CurvedAnimationController<Color> _animationBackground;
  late CurvedAnimationController<Color> _animationInput;
  late CurvedAnimationController<Color> _animationIcon;
  bool status = true;

  final Color _appbarBackgroundColorBegin = kPrimaryColor.withOpacity(1);
  final Color _appbarBackgroundColorEnd = kWhiteColor;

  final Color _inputBackgroundColorBegin = kWhiteColor.withOpacity(0.92);
  final Color _inputBackgroundColorEnd = const Color(0xFFEFEFEF);

  final Color _iconColorBegin = kWhiteColor.withOpacity(0.92);
  final Color _iconColorEnd = kBlackColor;
  @override
  void initState() {
    _initAnimation();
    super.initState();
    _initScroll();
  }

  _initAnimation() {
    _animationBackground = CurvedAnimationController<Color>.tween(
      ColorTween(
          begin: _appbarBackgroundColorBegin, end: _appbarBackgroundColorEnd),
      const Duration(milliseconds: 200),
      curve: Curves.ease,
      vsync: this,
    );

    _animationInput = CurvedAnimationController<Color>.tween(
      ColorTween(
          begin: _inputBackgroundColorBegin, end: _inputBackgroundColorEnd),
      const Duration(milliseconds: 300),
      curve: Curves.ease,
      vsync: this,
    );

    _animationIcon = CurvedAnimationController<Color>.tween(
      ColorTween(begin: _iconColorBegin, end: _iconColorEnd),
      const Duration(milliseconds: 300),
      curve: Curves.ease,
      vsync: this,
    );

    _animationBackground.addListener(() => setState(() {}));
    _animationInput.addListener(() => setState(() {}));
    _animationIcon.addListener(() => setState(() {}));
  }

  _initScroll() {
    _scrollViewController.addListener(() {
      double startAnimationAfterOffset = 5;
      double scrollOffsetBackground = 150;
      double scrollOffsetInput = 150;
      double scrollOffsetIcon = 120;

      if (_scrollViewController is ScrollStartNotification) {
        status = false;
      }
      if (_scrollViewController is ScrollEndNotification) {
        status = true;
      }

      // delay animation to start animate only after scrolling
      // as far as startAnimationAfterOffset value
      // this is for a smoother effect
      double offset = _scrollViewController.offset - startAnimationAfterOffset;
      double progressBackground = offset / scrollOffsetBackground;
      double progressInput = offset / scrollOffsetInput;
      double progressIcon = offset / scrollOffsetIcon;

      // make sure progress animation always between 0.0 and 1.0
      progressBackground = progressBackground <= 0.0 ? 0.0 : progressBackground;
      progressBackground = progressBackground >= 1.0 ? 1.0 : progressBackground;

      // make sure progress animation always between 0.0 and 1.0
      progressInput = progressInput <= 0.0 ? 0.0 : progressInput;
      progressInput = progressInput >= 1.0 ? 1.0 : progressInput;

      // make sure progress animation always between 0.0 and 1.0
      progressIcon = progressIcon <= 0.0 ? 0.0 : progressIcon;
      progressIcon = progressIcon >= 1.0 ? 1.0 : progressIcon;

      _animationBackground.progress = progressBackground;
      _animationInput.progress = progressInput;
      _animationIcon.progress = progressIcon;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    PreferredSizeWidget appBar() {
      return AppBar(
        toolbarHeight: getProportionateScreenHeight(48),
        backgroundColor: _animationBackground.value,
        elevation: 0,
        flexibleSpace: Container(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(18),
              top: getProportionateScreenHeight(32),
              right: getProportionateScreenWidth(12)),
          child: Row(children: [
            Expanded(
              child: Container(
                height: getProportionateScreenHeight(35),
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(7),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: getProportionateScreenWidth(0.25),
                  ),
                ),
                child: TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: InputBorder.none,
                    hintText: 'kodingworks',
                    hintStyle: kPrimaryTextStyle.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  style: kPrimaryTextStyle.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              width: getProportionateScreenWidth(20),
              child: Icon(
                Icons.mail_outline_outlined,
                color: _animationIcon.value,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              width: getProportionateScreenWidth(20),
              child: Icon(
                Icons.notifications_none_outlined,
                color: _animationIcon.value,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              width: getProportionateScreenWidth(20),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: _animationIcon.value,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(8)),
              width: getProportionateScreenWidth(20),
              child: Icon(
                Icons.menu,
                color: _animationIcon.value,
              ),
            ),
          ]),
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: const CustomNavBar(),
      body: NotificationListener(
        onNotification: (notificationInfo) {
          setState(() {
            if (notificationInfo is ScrollStartNotification) {
              status = false;
            }
            if (notificationInfo is ScrollEndNotification) {
              status = true;
            }
          });
          return true;
        },
        child: Stack(
          children: [
            ListView(
              controller: _scrollViewController,
              children: [
                HomeHeader(),
                const HomeMenu(),
                const HomeFlashSale(),
                const SpesialTokopedia(),
                const HomePromo(),
                const HomeCategory(),
              ],
            ),
            FloatBubble(
                show: status,
                child: Image.asset(
                  'assets/floating.gif',
                  height: getProportionateScreenHeight(120),
                )),
          ],
        ),
      ),
    );
  }
}
