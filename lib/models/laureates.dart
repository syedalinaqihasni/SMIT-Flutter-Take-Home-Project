class Laureates {
  String? id;
  String? knownName;
  String? fullName;
  String? portion;
  String? sortOrder;
  String? motivation;

  Laureates({
    this.fullName,
    this.id,
    this.knownName,
    this.motivation,
    this.portion,
    this.sortOrder,
  });

  factory Laureates.fromJson(Map<String, dynamic> json) {
    return Laureates(
      id: json['id'],
      knownName: json['knownName'],
      fullName: json['fullName'],
      portion: json['portion'],
      sortOrder: json['sortOrder'],
      motivation: json['motivation'],
    );
  }

  static void addAll(result) {}
}
