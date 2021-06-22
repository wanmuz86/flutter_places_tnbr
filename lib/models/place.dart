class Place {
  final String name;
  final String description;
  final String country;
  final double avgRating;

  Place({required this.name, required this.description, required this.country, required
  this.avgRating});

  factory Place.fromJson(Map<String, dynamic> json){
    return Place(
        name:json["name"]!,
        description:json["description"]!,
        country:json["country"]!,
        avgRating: json["avgRating"]!
    );
  }
}

