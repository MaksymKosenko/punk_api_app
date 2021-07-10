class BeerSplash{
  String name;
  String imageUrl;

  BeerSplash.fromJson(List<dynamic> json) :
        name = json[0]['name'],
        imageUrl = json[0]['image_url'] ??
            "https://images.punkapi.com/v2/15.png";
}