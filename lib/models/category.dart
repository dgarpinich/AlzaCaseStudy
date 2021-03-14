class Category {
  final String name;
  final String imgUrl;
  final String dataUrl;

  Category({
    this.name,
    this.imgUrl,
    this.dataUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json["name"],
      imgUrl: json["img"],
      dataUrl: json["self"]['href'],
    );
  }
}
