import 'package:flutter/material.dart';
import 'package:help_app/screens/food_donate.dart';
import 'package:help_app/screens/home.dart';
import 'package:help_app/screens/register_as_donter.dart';

List<Widget> _pages = <Widget>[
  Home(),
  FoodDonate(),
  Register(),
];

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedIndex == 0 ? Colors.red : Colors.amber,
      ),
      body: _pages.elementAt(_selectedIndex),
      endDrawer: Drawer(
        child: LayoutBuilder(builder: (context, constraints) {
          double height = constraints.maxHeight;
          return Column(
            children: [
              Container(
                height: height / 3,
                color: Colors.orange,
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? Colors.amberAccent
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _selectedIndex = 0;
                              },
                            );
                          },
                          icon: const Row(
                            children: [
                              Icon(
                                Icons.bloodtype,
                                color: Colors.red,
                                size: 30,
                              ),
                              Text(
                                "Boold Donates",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1
                              ? Colors.amberAccent
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _selectedIndex = 1;
                              },
                            );
                          },
                          icon: const Row(
                            children: [
                              Icon(
                                Icons.food_bank_outlined,
                                color: Colors.red,
                                size: 30,
                              ),
                              Text(
                                "Food Donates",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: _selectedIndex == 2
                              ? Colors.amberAccent
                              : Colors.orange,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                _selectedIndex = 2;
                              },
                            );
                          },
                          icon: const Row(
                            children: [
                              Icon(
                                Icons.app_registration_rounded,
                                color: Colors.red,
                                size: 30,
                              ),
                              Text(
                                "Register for Donate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height / 3,
                color: Colors.white,
              ),
              Container(
                color: Colors.green,
                height: height / 3,
              )
            ],
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.bloodtype,
              color: Colors.red,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              color: Colors.orange,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.app_registration_rounded,
              color: Colors.amberAccent,
              size: 30,
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(),
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}

// const TextStyle = {

// };
