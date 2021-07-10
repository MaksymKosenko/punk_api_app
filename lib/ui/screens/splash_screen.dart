import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk_api_app/cubit/beers_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BeerCubit>(context).fetchSplashBeer();

    void navigateToHomePage() {
      Timer(Duration(seconds: 4), () {
        Navigator.popAndPushNamed(context, "/Home");
      });
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: BlocBuilder<BeerCubit, BeerState>(
          builder: (context, state) {
            if (!(state is BeerSplashLoaded))
              return Center(child: CircularProgressIndicator());

            final beer = (state as BeerSplashLoaded).beer;
            navigateToHomePage();
            return Container(
              padding: EdgeInsets.only(top: 84, left: 16, right: 16),
              child: Column(
                children: [
                  Text(
                    "Beer of the day:",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 104),
                  Container(
                      padding: EdgeInsets.all(20),
                      height: 240,
                      width: 240,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Image.network(beer.imageUrl)),
                  SizedBox(height: 20),
                  Text(
                    beer.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xffFF9F0A),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
