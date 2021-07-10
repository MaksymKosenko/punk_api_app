import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk_api_app/cubit/beers_cubit.dart';

import 'package:punk_api_app/data/models/beer_home.dart';
import 'package:punk_api_app/api/api_service.dart';
import 'package:punk_api_app/repositories/repository.dart';

import 'package:punk_api_app/ui/screens/details_screen.dart';
import 'package:punk_api_app/ui/screens/home_screen/home_screen_body.dart';
import 'package:punk_api_app/ui/screens/splash_screen.dart';

class AppRouter {

  Repository repository;

  AppRouter() :
        repository = Repository(apiService: ApiService());


  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider(
                  create: (context) => BeerCubit(repository: repository),
                  child: SplashScreen(),
                ));
      case "/Home":
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => BeerCubit(repository: repository),
              child: HomeScreen(),
            ));
      case "/Details":
        final beer = settings.arguments as BeerHome;
        return MaterialPageRoute(builder: (context) => DetailsScreen(beer: beer,));
      default:
        return null;
    }
  }
}
