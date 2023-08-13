class NameModel {
  final String? name;
  final String? lang;
  NameModel({
    this.name,
    this.lang,
  });

  factory NameModel.fromJson(json) {
    return NameModel(
      name: json["name"],
      lang: json["language"]["name"],
    );
  }
}
