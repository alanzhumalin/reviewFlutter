import 'package:flutter/material.dart';
import 'package:posts/catalog.dart';
import 'package:posts/pooo.dart';
import 'package:posts/profiles.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pages = [Catalog(), Profiles(), Pooo()];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.blueGrey,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                label: "Catalog", icon: Icon(Icons.podcasts)),
            BottomNavigationBarItem(
                label: "Profiles", icon: Icon(Icons.account_box)),
            BottomNavigationBarItem(
                label: "My account", icon: Icon(Icons.balance))
          ]),
    );
  }
}
