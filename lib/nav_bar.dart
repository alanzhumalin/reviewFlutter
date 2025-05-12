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
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(label: "Catalog", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Profiles", icon: Icon(Icons.account_box)),
            BottomNavigationBarItem(label: "Govono", icon: Icon(Icons.balance))
          ]),
    );
  }
}
