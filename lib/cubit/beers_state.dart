part of 'beers_cubit.dart';

@immutable
abstract class BeerState {
}

class BeerInitial extends BeerState {}

class BeerSplashLoaded extends BeerState{
  final BeerSplash beer;

  BeerSplashLoaded({required this.beer});
}

class BeerHomeLoaded extends BeerState{
  final List<BeerHome> beers;

  BeerHomeLoaded({required this.beers});
}

class BeerSearchLoaded extends BeerState{
  final List<BeerHome> beers;

  BeerSearchLoaded({required this.beers});
}

class BeerSearchEmpty extends BeerState{
  final String message;

  BeerSearchEmpty({required this.message});
}

class BeerError extends BeerState{
  final String message;

  BeerError({required this.message});
}