class ProductFull {
  final String name;
  final String spec;
  final List<String> imgsUrls;
  final String price;
  final String cPrice;
  final String priceWithoutVat;
  final String salePercentage;
  final String availability;
  final String availPostfix;
  final double rating;

  ProductFull({
    this.name,
    this.spec,
    this.imgsUrls,
    this.price,
    this.cPrice,
    this.priceWithoutVat,
    this.salePercentage,
    this.availability,
    this.availPostfix,
    this.rating,
  });

  factory ProductFull.fromJson(Map<String, dynamic> json) {
    List<String> imgs = Iterable.castFrom(json['imgs'])
        .map((i) => i['origUrl'].toString())
        .toList();
    return ProductFull(
      name: json["name"],
      spec: json["spec"],
      imgsUrls: imgs,
      price: json["price"],
      cPrice: json["cprice"],
      priceWithoutVat: json["priceWithoutVat"],
      salePercentage: json["salePercentage"],
      availability: json["avail"],
      availPostfix: json["avail_postfix"],
      rating: double.tryParse(json["rating"].toString()),
    );
  }
}
