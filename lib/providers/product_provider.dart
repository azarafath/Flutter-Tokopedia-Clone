import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/product.dart';

class ProductProvider extends ChangeNotifier {
  Future<List<Product>?> getProducts() async {
    Uri url = Uri.parse(
        'https://28f53f68-3184-43da-9d52-f967ca8384be.mock.pstmn.io/products');

    try {
      var result = await http.get(url);
      if (result.statusCode == 200) {
        List data = jsonDecode(result.body);
        List<Product> _product =
            data.map((item) => Product.fromJson(item)).toList();
        return _product;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
