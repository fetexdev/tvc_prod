class StoreModel {
  String id;
  String title;
  String latitude;
  String longitude;
  String rating;
  String reviews;
  String orarioLunedi;
  String orarioMartedi;
  String orarioMercoledi;
  String orarioGiovedi;
  String orarioVenerdi;
  String orarioSabato;
  String orarioDomenica;
  String phone;
  String address;
  String description;
  String images;

  StoreModel({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.rating,
    required this.reviews,
    required this.orarioLunedi,
    required this.orarioMartedi,
    required this.orarioMercoledi,
    required this.orarioGiovedi,
    required this.orarioVenerdi,
    required this.orarioSabato,
    required this.orarioDomenica,
    required this.phone,
    required this.address,
    required this.description,
    required this.images,
  });

  factory StoreModel.fromJson(Map<String, dynamic> data) {
    return StoreModel(
      id: data["id"] ?? "null",
      title: data["title"] ?? "null",
      latitude: data["latitude"] ?? "null",
      longitude: data["longitude"] ?? "null",
      rating: data["rating"] ?? "null",
      reviews: data["reviews"] ?? "null",
      orarioLunedi: data["orarioLunedi"] ?? "null",
      orarioMartedi: data["orarioMartedi"] ?? "null",
      orarioMercoledi: data["orarioMercoledi"] ?? "null",
      orarioGiovedi: data["orarioGiovedi"] ?? "null",
      orarioVenerdi: data["orarioVenerdi"] ?? "null",
      orarioSabato: data["orarioSabato"] ?? "null",
      orarioDomenica: data["orarioDomenica"] ?? "null",
      phone: data["phone"] ?? "null",
      address: data["address"] ?? "null",
      description: data["description"] ?? "null",
      images: data["images"] ?? "null",
    );
  }
}
