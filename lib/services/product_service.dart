import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tokped/models/product.dart';

class ProductService {
  Future<List<Product>?> getProduct() async {
    Uri url = Uri.parse(
        'https://4c1fa8f1-6852-44c7-a30d-4e6bb94c5649.mock.pstmn.io/products');

    try {
      var result = await http.get(url);
      print(result.body);
      if (result.statusCode == 200) {
        List<Product> _product = productFromJson(result.body);
        return _product;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
