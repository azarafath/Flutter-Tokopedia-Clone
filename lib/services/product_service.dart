import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tokped/models/product.dart';

class ProductService {
  String baseUrl = 'url';

  Future<List<Product>> getProduct() async {
    var url = Uri.parse('$baseUrl/products');

    var response = await http.get(url);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<Product> products = [];
      for (var item in data) {
        products.add(
          Product(
            id: item['id'],
            price: item['price'],
            image: item['image'],
            discount: item['discount'],
          ),
        );
      }
      return products;
    } else {
      throw Exception('Gagal get products!');
    }
  }
}
