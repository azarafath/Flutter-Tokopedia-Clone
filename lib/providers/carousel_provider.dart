import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/carousel.dart';

class CarouselProvider extends ChangeNotifier {
  Future<List<Carousel>?> getCarousel() async {
    Uri url = Uri.parse(
        'https://4c1fa8f1-6852-44c7-a30d-4e6bb94c5649.mock.pstmn.io/carousel');
    var result = await http.get(url);

    print(result.statusCode);
    print(result.body);

    try {
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
