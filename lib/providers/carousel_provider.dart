import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/carousel.dart';

class CarouselProvider extends ChangeNotifier {
  Future<List<Carousel>?> getCarousel() async {
    Uri url = Uri.parse(
        'https://04183302-a6bd-4e68-a7b5-40a682daedb0.mock.pstmn.io/carousel');

    try {
      var result = await http.get(url);

      print(result.statusCode);
      print(result.body);
      if (result.statusCode == 200) {
        List data = jsonDecode(result.body);
        List<Carousel> _carousel =
            data.map((item) => Carousel.fromJson(item)).toList();
        return _carousel;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
