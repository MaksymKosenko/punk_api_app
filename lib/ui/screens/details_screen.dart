import 'package:flutter/material.dart';

import 'package:punk_api_app/data/models/beer_home.dart';

class DetailsScreen extends StatelessWidget {
  final BeerHome beer;

  const DetailsScreen({Key? key, required this.beer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(0, 0, 0, 250),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Details"),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Text(
                beer.name,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xffFF9F0A),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                beer.tagLine,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                height: 240,
                width: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Image.network(beer.imageUrl),
              ),
              SizedBox(height: 20),
              Text(
                "Made by ${beer.contributedBy.split("<")[0].trimRight()}, for the first time on ${beer.firsBrewed}",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xffBDBDBD),
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description:",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Text(
                    beer.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Good with:",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  for (var u in beer.foodPairing)
                    Text(
                      "• $u",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(height: 30),
                  Text(
                    "Some brewers tips:",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    beer.brewersTips,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
