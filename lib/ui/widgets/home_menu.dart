import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tokped/size_config.dart';
import 'package:tokped/ui/widgets/icon_menu_widget.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        CarouselSlider(
          options:
              CarouselOptions(viewportFraction: 0.95, aspectRatio: 50 / 16),
          items: [
            'assets/carousel_1.jpg',
            'assets/carousel_2.jpg',
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      i,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            );
          }).toList(),
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
