import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:punk_api_app/cubit/beers_cubit.dart';

class HomeScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({Key? key}) : super(key: key);

  @override
  _HomeScreenAppBarState createState() => _HomeScreenAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _HomeScreenAppBarState extends State<HomeScreenAppBar> {
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    void changeSearchView() {
      setState(() {
        isSearchActive = !isSearchActive;
        if (!isSearchActive)
          BlocProvider.of<BeerCubit>(context).fetchHomeBeers();
      });
    }

    TextEditingController controller = TextEditingController();

    void clearInput() {
      controller.clear();
      BlocProvider.of<BeerCubit>(context).fetchHomeBeers();
    }

    return AppBar(
      leading: isSearchActive
          ? IconButton(
              onPressed: () => changeSearchView(),
              icon: Icon(Icons.keyboard_arrow_left))
          : Container(),
      title: isSearchActive ? _search(controller) : Text("Beers List"),
      actions: [
        !isSearchActive
            ? IconButton(
                onPressed: () => changeSearchView(), icon: Icon(Icons.search))
            : IconButton(
                onPressed: () => clearInput(), icon: Icon(Icons.clear)),
      ],
      backgroundColor: Color(0xffFF9F0A),
    );
  }

  Widget _search(TextEditingController controller) {
    onChangeFunc(String text) {
      if (text.isEmpty)
        BlocProvider.of<BeerCubit>(context).fetchHomeBeers();
      else
        BlocProvider.of<BeerCubit>(context).fetchSearchBeers(text);
    }

    return Container(
      //color: Colors.white,
      padding: EdgeInsets.all(8),
      child: TextField(
        autofocus: true,
        controller: controller,
        onChanged: (text) => onChangeFunc(text),
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white, fontSize: 20),
          hintText: "Search",
        ),
      ),
    );
  }
}
