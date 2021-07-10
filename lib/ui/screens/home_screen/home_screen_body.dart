import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk_api_app/cubit/beers_cubit.dart';

import 'package:punk_api_app/data/models/beer_home.dart';

import 'package:punk_api_app/ui/screens/home_screen/home_screen_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<BeerCubit>(context).fetchHomeBeers();

    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 250),
      appBar: HomeScreenAppBar(),
      body: BlocBuilder<BeerCubit, BeerState>(
        builder: (context, state) {
          if (state is BeerSplashLoaded)
            return Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));

          if (state is BeerSearchEmpty)
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );

          if (state is BeerError)
            return Center(
              child: Text(
                state.message,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            );

          List<BeerHome> beers = [];

          if (state is BeerHomeLoaded) beers = (state as BeerHomeLoaded).beers;

          if (state is BeerSearchLoaded) beers = (state as BeerSearchLoaded).beers;

          if (beers.isEmpty && !(state is BeerError)) {
            BlocProvider.of<BeerCubit>(context).showEmptySearchResult();
          }

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: beers.map((e) => _beerCard(e, context)).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _beerCard(BeerHome beer, BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, "/Details", arguments: beer),
          child: Container(
            height: 120,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: Stack(
              children: [
                Image.network(
                  beer.imageUrl,
                  width: 40,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 64, right: 76),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          beer.name,
                          style: TextStyle(
                            color: Color(0xffFF9F0A),
                            fontSize: 18,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 16),
                        Text(
                          beer.tagLine,
                          style: TextStyle(fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      beer.firsBrewed,
                    ))
              ],
            ),
          ),
        ),
        Divider(
          color: Color.fromARGB(160, 255, 255, 255),
        ),
      ],
    );
  }
}
