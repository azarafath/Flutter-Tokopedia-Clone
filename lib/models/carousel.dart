class Carousel {
  late int id;
  late String image;
  Carousel({
    required this.id,
    required this.image,
  });

  Carousel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
