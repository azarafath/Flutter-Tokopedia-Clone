import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tokped/models/carousel.dart';
import 'package:tokped/providers/carousel_provider.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/theme.dart';
import 'package:tokped/ui/widgets/icon_menu_widget.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CarouselProvider carouselProvider = Provider.of<CarouselProvider>(context);
    Widget buildCarousel(carousel) {
      return CarouselSlider(
        options: CarouselOptions(viewportFraction: 0.95, aspectRatio: 50 / 16),
        items: carousel.map<Widget>((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    i.image.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          );
        }).toList(),
      );
    }

    Widget skeletonCarousel() {
      return CarouselSlider(
        options: CarouselOptions(viewportFraction: 0.95, aspectRatio: 50 / 16),
        // item shimmer container
        items: [
          Shimmer.fromColors(
            baseColor: kLineDarkColor,
            highlightColor: kWhiteGreyColor,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.grey[300],
                  height: getProportionateScreenHeight(50),
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: kLineDarkColor,
            highlightColor: kWhiteGreyColor,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.grey[300],
                  height: getProportionateScreenHeight(50),
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              IconMenu(
                label: 'Official Store',
                image: 'assets/icon_official_storee.png',
              ),
              IconMenu(
                label: 'Lihat Semua',
                image: 'assets/icon_lihat_semua.png',
              ),
              IconMenu(
                label: 'Kebutuhan Harian',
                image: 'assets/icon_kebutuhan_harian.png',
              ),
              IconMenu(
                label: 'Handphone & Tablet',
                image: 'assets/icon_handphone_tablet.png',
              ),
              IconMenu(
                label: 'TopUp & Tagihan',
                image: 'assets/icon_tagihan.png',
              ),
              IconMenu(
                label: 'Travel & Entertainment',
                image: 'assets/icon_travel.png',
              ),
              IconMenu(
                label: 'Keuangan',
                image: 'assets/icon_keuangan.png',
              ),
              IconMenu(
                label: 'Kesehatan',
                image: 'assets/icon_kesehatan.png',
              ),
              IconMenu(
                label: 'Elektronik',
                image: 'assets/icon_elektronik.png',
              ),
              IconMenu(
                label: 'Office & Stationery',
                image: 'assets/icon_office_stationery.png',
              ),
              IconMenu(
                label: 'Perawatan Tubuh',
                image: 'assets/icon_perawatan_tubuh.png',
              ),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        FutureBuilder(
          future: carouselProvider.getCarousel(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Carousel> carousel = snapshot.data;
              return buildCarousel(carousel);
            } else {
              return skeletonCarousel();
            }
          },
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              IconMenu(
                label: 'Deals Hari Ini',
                image: 'assets/icon_promo.png',
              ),
              IconMenu(
                label: 'Live Shopping',
                image: 'assets/icon_live_shopping.png',
              ),
              IconMenu(
                label: 'Tokopedia Seru',
                image: 'assets/icon_tokopedia_seru.png',
              ),
              IconMenu(
                label: 'Promo di Semarang',
                image: 'assets/icon_promo_lokasi.png',
              ),
              IconMenu(
                label: 'Bayar di Tempat',
                image: 'assets/icon_cod.png',
              ),
              IconMenu(
                label: 'Bangga Lokal',
                image: 'assets/icon_bangga_lokal.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
