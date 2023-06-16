import 'package:auto_route/auto_route.dart';
import 'package:demo_movies/app_config.dart';
import 'package:demo_movies/page/movie_list/movie_list_page.dart';
import 'package:flutter/material.dart';

import '../../common/app_constants.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;

  _onSelectItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < AppConstants.TITLE_LIST.length; i++) {
      drawerOptions.add(
          ListTile(
            title: Text(AppConstants.TITLE_LIST[i], style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),),
            selected: i == _selectedIndex,
            onTap: () => _onSelectItem(i),)
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConfig.appName),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue
              ),
              child: Image.asset(
                'assets/icons/ic_launcher.png',
                width: 200,
                height: 200,
              ),
            ),
            Column(
              children: drawerOptions
            )
          ],
        ),
      ),
      body: MovieListPage(selectedIndex: _selectedIndex),
    );
  }
}
