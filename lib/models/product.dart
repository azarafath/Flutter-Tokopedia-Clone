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
  });

  int id;
  String name;
  String image;
  int price;
  int discount;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        discount: json["discount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "discount": discount,
      };
}

// EXAMPLE RESPONSE

// [
//   {
//     "id": 1,
//     "name" : "Sambal Ikan Segar",
//     "image": "assets/product_1.png",
//     "price": 100000,
//     "discount": 70
//   },
//   {
//     "id": 2,
//     "name" : "Sticker Anti Air",
//     "image": "assets/product_2.jpg",
//     "price": 500000,
//     "discount": 50
//   },
//   {
//     "id": 3,
//     "name" : "Qualcomm Charge",
//     "image": "assets/product_3.jpg",
//     "price": 80000,
//     "discount": 40
//   },
//   {
//     "id": 4,
//     "name" : "MaduKu Asli",
//     "image": "assets/product_4.jpg",
//     "price": 100000,
//     "discount": 50
//   }
// ]