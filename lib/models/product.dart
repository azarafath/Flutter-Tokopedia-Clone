// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discount,
    required this.city,
    required this.star,
    required this.terjual,
  });

  int id;
  String name;
  String image;
  int price;
  int discount;
  String city;
  double star;
  int terjual;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        discount: json["discount"],
        city: json["city"],
        star: json["star"].toDouble(),
        terjual: json["terjual"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "discount": discount,
        "city": city,
        "star": star,
        "terjual": terjual,
      };
}
