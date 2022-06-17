import 'dart:convert';

List<Carousel> carouselFromJson(String str) =>
    List<Carousel>.from(json.decode(str).map((x) => Carousel.fromJson(x)));

String carouselToJson(List<Carousel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Carousel {
  Carousel({
    required this.id,
    required this.image,
  });

  int id;
  String image;

  factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}


// preview
// [
//     {
//             "id": 1,
//             "image": "assets/carousel_1.jpg"
//         },
//         {
//             "id": 2,
//             "image": "assets/carousel_2.jpg"
//         }
    
// ]
