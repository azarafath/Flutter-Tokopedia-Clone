import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    required this.id,
    required this.image,
    required this.price,
    required this.discount,
  });

  int id;
  String image;
  int price;
  int discount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: json["image"],
        price: json["price"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "price": price,
        "discount": discount,
      };
}

// [

//     {
//             "id": 1,
//             "image": "assets/product_1.jpg",
//             "price": 100000,
//             "discount": 70
//         },
//         {
//             "id": 2,
//             "image": "assets/product_2.jpg",
//             "price": 500000,
//             "discount": 50
//         },
//         {
//             "id": 3,
//             "image": "assets/product_3.jpg",
//             "price": 80000,
//             "discount": 40
//         },
//         {
//             "id": 4,
//             "image": "assets/product_4.jpg",
//             "price": 900000,
//             "discount": 80
//         }
// ]