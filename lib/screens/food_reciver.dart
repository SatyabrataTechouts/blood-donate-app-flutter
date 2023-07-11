import 'package:flutter/material.dart';
import 'package:help_app/components/custum_input.dart';

var orgName = TextEditingController();
var orgPhone = TextEditingController();
var orgState = TextEditingController();
var orgPin = TextEditingController();
String? nameValidator(String value) {
  final bool nameValid = RegExp(r"^[A-Za-z]+$").hasMatch(value);
  print('====$nameValid');
  if (value.isEmpty) {
    return "Please enter the above field";
  } else if (!nameValid) {
    return "Please enter a valid name";
  }
  return null;
}

String? phoneValidator(String value) {
  if (value.length < 10 || value.isEmpty) {
    return "Enter 10 digit number";
  }
  return null;
}

String? pinValidator(String value) {
  if (value.length < 6 || value.isEmpty) {
    return "Enter valid pin code";
  }
  return null;
}

List<Map<String, dynamic>> item = [
  {
    "name": orgName,
    "controller": TextEditingController(),
    "placeholder": "Enter Org Name",
    "validator": (value) => nameValidator(value),
  },
  {
    "name": "orgPhone",
    "controller": TextEditingController(),
    "placeholder": "Enter org Phone",
    "validator": (value) => phoneValidator(value),
    "maxLength": 10,
    "type": TextInputType.number
  },
  {
    "name": "orgState",
    "controller": TextEditingController(),
    "placeholder": "Enter org State"
  },
  {
    "name": "orgPin",
    "controller": TextEditingController(),
    "placeholder": "Enter org pincode",
    "maxLength": 6,
    "type": TextInputType.number,
    "validator": (value) => pinValidator(value),
  },
];

class FoodReceiver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(
              18,
            ),
            child: Input(
              controller: item[index]['controler'],
              placeholder: item[index]['placeholder'],
              validator: item[index]['validator'],
              maxLength: item[index]['maxLength'],
              type: item[index]['type'],
            ),
          );
        },
        itemCount: item.length,
      ),
    );
  }
}
