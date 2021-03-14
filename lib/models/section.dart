class Section {
  final String name;
  final String iconUrl;
  final String iconSelectedUrl;
  final String logoUrl;
  final String colorStart;
  final String colorEnd;
  final String categoriesUrl;

  Section({
    this.name,
    this.iconUrl,
    this.iconSelectedUrl,
    this.logoUrl,
    this.colorStart,
    this.colorEnd,
    this.categoriesUrl,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      name: json["name"],
      iconUrl: json["iconUrl"],
      iconSelectedUrl: json["iconSelectedUrl"],
      logoUrl: json["logoUrl"],
      colorStart: json["colorStart"],
      colorEnd: json["colorEnd"],
      categoriesUrl: json['section']['self']['href'],
    );
  }
}
