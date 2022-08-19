class Animal {
  String? name, image, habitat, diet;

  Animal({this.diet, this.habitat, this.image, this.name});

  factory Animal.fromJson(json) {
    return Animal(
        name: json["name"] ?? "",
        image: json["image_link"] ?? "",
        habitat: json["habitat"] ?? "",
        diet: json["diet"] ?? "");
  }
}
