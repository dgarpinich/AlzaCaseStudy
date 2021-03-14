class Product {
  final String name;
  final String imgUrl;
  final String price;
  final String cPrice;
  final String discount;
  final String availability;
  final double ratingStars;
  final String detailUrl;

  Product({
    this.name,
    this.imgUrl,
    this.price,
    this.cPrice,
    this.discount,
    this.availability,
    this.ratingStars,
    this.detailUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"],
      imgUrl: json["imgUrl"],
      price: json["price"],
      cPrice: json["cPrice"],
      discount: json["discount"],
      availability: json["availability"],
      ratingStars: json["ratingStars"],
      detailUrl: json['self']['href'],
    );
  }
}
