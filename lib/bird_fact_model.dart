class BirdFact {
  String? breed;
  String? country;
  String? origin;
  String? coat;
  String? pattern;

  BirdFact({this.breed, this.country, this.origin, this.coat, this.pattern});

  BirdFact.fromJson(Map<String, dynamic> json) {
    breed = json['breed'];
    country = json['country'];
    origin = json['origin'];
    coat = json['coat'];
    pattern = json['pattern'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['breed'] = breed;
    data['country'] = country;
    data['origin'] = origin;
    data['coat'] = coat;
    data['pattern'] = pattern;
    return data;
  }

  static List<BirdFact> fetchData(Map<String, dynamic> json) {
    List<BirdFact> list = [];
    List data = json['data'] ?? [];
    for (var element in data) {
      list.add(BirdFact.fromJson(element));
    }
    return list;
  }
}
