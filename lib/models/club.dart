class Club {
  String? name;
  String? country;
  int? value;
  String? image;
  int? europeanTitles;

  Club.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    value = json['value'];
    image = json['image'];
    europeanTitles = json['european_titles'];
  }
}
