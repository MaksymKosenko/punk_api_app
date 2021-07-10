class BeerHome {
  String name;
  String imageUrl;
  String tagLine;
  String firsBrewed;
  String description;
  List<dynamic> foodPairing;
  String brewersTips;
  String contributedBy;

  BeerHome.fromJson(Map json) :
        name = json['name'] ?? "name is missing",
        imageUrl = json['image_url'] ?? "https://images.punkapi.com/v2/15.png",
        tagLine = json['tagline'] ?? "no tagline",
        firsBrewed = json['first_brewed'] ?? "no data about first brewed time",
        description= json['description'] ?? "no description",
        foodPairing= json['food_pairing'] ?? "food pairing is missing" as List,
        brewersTips= json['brewers_tips'] ?? "no brewers tips",
        contributedBy= json['contributed_by']?? "there is no information about the manufacturer";
}