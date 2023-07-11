import 'package:flutter/material.dart';
import 'package:help_app/components/custum_button.dart';
import 'package:help_app/screens/food_reciver.dart';
import 'package:help_app/screens/register_blood_donate.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/help1.jpg",
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustumButton(
                  buttonName: "Register for Blood",
                  height: 40,
                  width: 160,
                  color: Colors.red,
                  radius: 12,
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterBloodDonate(),
                      ),
                    );
                  },
                ),
                CustumButton(
                  buttonName: "Food Receiver org",
                  height: 40,
                  width: 160,
                  color: Colors.orange,
                  radius: 12,
                  textColor: Colors.white,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FoodReceiver(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
