import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_app/RegistredBloc/registered_bloc.dart';
import 'package:help_app/RegistredBloc/registered_event.dart';
import 'package:help_app/components/custum_button.dart';
import 'package:help_app/components/custum_input.dart';
import 'package:help_app/model/registred_model.dart';

List<String> list = [
  "A+",
  "B+",
  "AB+",
  "O+",
  "O-",
];

class RegisterBloodDonate extends StatefulWidget {
  @override
  State<RegisterBloodDonate> createState() => _RegisterBloodDonateState();
}

class _RegisterBloodDonateState extends State<RegisterBloodDonate> {
  String dropdownValue = list.first;
  bool isError = true;
  @override
  Widget build(BuildContext context) {
    var name = TextEditingController();
    var blood = TextEditingController();
    var district = TextEditingController();
    var state = TextEditingController();
    var pin = TextEditingController();
    var mobile = TextEditingController();

    var _valid;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 300,
                      // height: 47,
                      // alignment: Alignment.center,
                      child: Input(
                        controller: name,
                        validator: (value) {
                          final bool nameValid = RegExp("[A-Za-z]\$").hasMatch(
                            value.toString(),
                          );
                          print('====$nameValid');
                          if (value == "") {
                            // isError = true;
                            return "Please Enter above field";
                          } else if (!nameValid) {
                            // isError = true;
                            return "Please Enter valid name";
                          }
                          isError = false;
                          return null;
                        },
                        placeholder: "Enter your name",
                      ),
                    ),
                    Container(
                        width: 300,
                        margin: EdgeInsets.only(
                          bottom: 23,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Container(
                          padding: const EdgeInsets.all(
                            5,
                          ),
                          width: 300,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(dropdownValue == null
                                  ? "Enter "
                                  : dropdownValue),
                              value: dropdownValue,
                              onChanged: (value) {
                                print(value);
                                print(dropdownValue);
                                setState(
                                  () {
                                    dropdownValue = value.toString();
                                  },
                                );
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        )),
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: Input(
                        controller: mobile,
                        validator: (value) {
                          final bool dist = RegExp('^[A-Za-z\s]+\$').hasMatch(
                            value.toString(),
                          );
                          if (!dist) {
                            return "Enter valid mobile Number";
                          } else if (value == '') {
                            return "Please Enter you mobile Number";
                          }
                          return null;
                        },
                        placeholder: "Enter your Mobile number",
                      ),
                    ),
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: Input(
                        key: _valid,
                        controller: district,
                        validator: (value) {
                          final bool dist = RegExp('^[A-Za-z\s]+\$').hasMatch(
                            value.toString(),
                          );
                          if (!dist) {
                            return "Enter valid district name";
                          } else if (value == '') {
                            return "Please Enter you district";
                          }
                          return null;
                        },
                        placeholder: "Enter your District",
                      ),
                    ),
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: Input(
                        controller: state,
                        validator: (value) {
                          final validState =
                              RegExp("^[A-Za-z\s]+(?:\s[A-Za-z\s]+)?\$")
                                  .hasMatch(value.toString());
                          if (!validState) {
                            return "Enter valid State";
                          } else if (value == '') {
                            return "Cant be Empty";
                          }
                          return null;
                        },
                        placeholder: "Enter your State",
                      ),
                    ),
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: Input(
                        controller: pin,
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Enter valid Pincode";
                          } else if (value == '') {
                            return "Pincode Cant be Empty";
                          }
                          return null;
                        },
                        placeholder: "Enter your Pincode",
                      ),
                    ),
                    CustumButton(
                      buttonName: "Submited",
                      height: 45,
                      width: 120,
                      color: Colors.green,
                      radius: 12,
                      textColor: Colors.white,
                      onTap: () {
                        RegistredUser user = RegistredUser(
                          name: name.text,
                          bloodGroup: dropdownValue,
                          state: state.text,
                          pinCode: pin.text,
                          mobileNumber: mobile.text,
                        );

                        context.read<RegisteredBloc>().add(
                              AddUserEvent(
                                user,
                              ),
                            );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
