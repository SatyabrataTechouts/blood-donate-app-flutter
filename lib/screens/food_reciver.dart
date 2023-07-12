import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_app/bloc/org_bloc.dart';
import 'package:help_app/components/custum_button.dart';
import 'package:help_app/components/custum_input.dart';
import 'package:help_app/model/OrgUser_model.dart';

import '../model/new_file.dart';

final TextEditingController orgName = TextEditingController();
final TextEditingController orgPhone = TextEditingController();
final TextEditingController orgState = TextEditingController();
final TextEditingController orgPin = TextEditingController();

class FoodReceiver extends StatelessWidget {
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

  get value {
    List<NewFile> item = [
      NewFile(
        name: "orgName",
        controller: orgName,
        placeholder: "Enter Org Name",
        validator: (value) => nameValidator(value ?? ''),
      ),
      NewFile(
          name: "orgPhone",
          controller: orgPhone,
          placeholder: "Enter Org Phone",
          validator: (value) => phoneValidator(value ?? ''),
          type: TextInputType.number,
          maxLength: 10),
      NewFile(
        name: "orgState",
        controller: orgState,
        placeholder: "Enter you State",
      ),
      NewFile(
          name: "orgPin",
          controller: orgPin,
          placeholder: "Enter you Pincode",
          validator: (value) => pinValidator(value ?? ''),
          type: TextInputType.number,
          maxLength: 6)
    ];
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(
                      18,
                    ),
                    child: Input(
                      controller: value[index].controller,
                      placeholder: value[index].placeholder,
                      validator: value[index].validator,
                      maxLength: value[index].maxLength,
                      type: value[index].type,
                    ),
                  );
                },
                itemCount: value.length,
              ),
            ),
            CustumButton(
              buttonName: "Register",
              height: 45,
              width: 120,
              color: Colors.blue,
              radius: 12,
              textColor: Colors.white,
              onTap: () {
                if (validateForm()) {
                  OrgModel user = OrgModel(
                    name: orgName.text,
                    State: orgState.text,
                    mobile: orgPhone.text,
                    pin: orgPin.text,
                  );
                  print(orgName.text);
                  context.read<OrgBloc>().add(
                        OrgAdd(
                          user,
                        ),
                      );
                  Navigator.pop(
                    context,
                  );
                } else {
                  showPopup(
                    context,
                    "All field mendotary",
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

bool validateForm() {
  // Perform validation for each form field
  final bool nameValid = RegExp(r"[A-Za-z]").hasMatch(orgName.text);
  final bool mobileValid = RegExp(r'^[6-9]\d{9}$').hasMatch(orgPhone.text);
  // final bool districtValid = RegExp(r'^[A-Za-z\s]+$').hasMatch(orgState.text);
  final bool stateValid =
      RegExp(r'^[A-Za-z\s]+(?:\s[A-Za-z\s]+)?$').hasMatch(orgState.text);
  final bool pinValid = orgPin.text.length == 6;

  return nameValid && mobileValid && stateValid && pinValid;
}

void showPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Error',
        ),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text(
              'OK',
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
