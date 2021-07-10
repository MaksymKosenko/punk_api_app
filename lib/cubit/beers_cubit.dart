import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:punk_api_app/data/models/beer_home.dart';
import 'package:punk_api_app/data/models/beer_splash.dart';
import 'package:punk_api_app/repositories/repository.dart';

part 'beers_state.dart';

class BeerCubit extends Cubit<BeerState> {
  BeerCubit({required this.repository}) : super(BeerInitial());

  final Repository repository;


  void fetchSplashBeer() {
    repository.fetchSplashBeer().then((beer) {
      emit(BeerSplashLoaded(beer: beer));
    });
  }

  void fetchHomeBeers() {
    repository.fetchHomeBeer().then((beers) {
      emit(BeerHomeLoaded(beers: beers));
    });
  }

  void fetchSearchBeers(String q) {

    repository.fetchSearchBeer(q)
      ..then((beers) {
        emit(BeerSearchLoaded(beers: beers));
      })
      ..onError((error, stackTrace) {
        emit(BeerError(message: "Search request error!"));
        return [];
      });
  }

  void showEmptySearchResult() {
    emit(BeerSearchEmpty(message: "Search result is empty!"));
  }
}
