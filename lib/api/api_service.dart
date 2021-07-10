import 'dart:convert';

import 'package:http/http.dart';

class ApiService{

  Future<dynamic> fetchSplashBeer() async{
    final String url = 'https://api.punkapi.com/v2/beers/random';
    try{
     final response = await get(Uri.parse(url));
     print(response.body);
     return jsonDecode(response.body);
    }catch(e){
      print(e);
    }
  }

  Future<List<dynamic>> fetchHomeBeer() async{
    final String url = 'https://api.punkapi.com/v2/beers';
    try{
      final response = await get(Uri.parse(url));
      print(response.body);
      return jsonDecode(response.body) as List;
    }catch(e){
      print(e);
      return [];
    }
  }

  Future<List<dynamic>> fetchSearchBeer(String q) async{

    final String url = 'https://api.punkapi.com/v2/beers?beer_name=$q';
    try{
      final response = await get(Uri.parse(url));
      print(response.body);
      return jsonDecode(response.body) as List;
    }catch(e){
      print(e);
      return [e];
    }
  }
}