import 'package:punk_api_app/api/api_service.dart';

import 'package:punk_api_app/data/models/beer_home.dart';
import 'package:punk_api_app/data/models/beer_splash.dart';


class Repository {
  final ApiService apiService;

  Repository({required this.apiService});

  Future<BeerSplash> fetchSplashBeer() async {
    final splashBeer = await apiService.fetchSplashBeer();
    return BeerSplash.fromJson(splashBeer);
  }

  Future<List<BeerHome>> fetchHomeBeer() async {
    final homeBeer = await apiService.fetchHomeBeer();
    return homeBeer.map((e) => BeerHome.fromJson(e)).toList();
  }

  Future<List<BeerHome>> fetchSearchBeer(String q) async {
    final homeBeer = await apiService.fetchSearchBeer(q);
    return homeBeer.map((e) => BeerHome.fromJson(e)).toList();
  }
}
