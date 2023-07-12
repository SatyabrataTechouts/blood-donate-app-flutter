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
  String heading() {
    switch (_selectedIndex) {
      case 0:
        return 'Blood Donar Avaliable';

      case 1:
        return 'Food Reciever Available';

      case 2:
        return 'Register User';
      default:
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        title: Text(
          heading(),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
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
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.bloodtype,
              color: Colors.white,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              color: Colors.white,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.app_registration_rounded,
              color: Colors.white,
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
