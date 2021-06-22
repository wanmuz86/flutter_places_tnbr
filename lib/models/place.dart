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

  static List<Place> placesFromJson(dynamic json ){
    var places = json;
    List<Place> results = new List.empty(growable: true);
    if (places != null){

      places.forEach((v)=>{
        results.add(Place.fromJson(v))
      });
      return results;
    }
    return results;
  }

}

