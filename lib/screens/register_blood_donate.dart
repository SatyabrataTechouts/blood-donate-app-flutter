import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help_app/RegistredBloc/registered_bloc.dart';
import 'package:help_app/RegistredBloc/registered_event.dart';
import 'package:help_app/components/custum_button.dart';
import 'package:help_app/components/custum_input.dart';
import 'package:help_app/model/registred_model.dart';
import 'package:help_app/screens/navigation/navigation.dart';

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

var name = TextEditingController();
var blood = TextEditingController();
var district = TextEditingController();
var state = TextEditingController();
var pin = TextEditingController();
var mobile = TextEditingController();

class _RegisterBloodDonateState extends State<RegisterBloodDonate> {
  String dropdownValue = list.first;
  bool isError = true;
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  @override
  Widget build(BuildContext context) {
    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();
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
                        type: TextInputType.number,
                        maxLength: 10,
                        validator: (value) {
                          final bool dist = RegExp('^[6-9]\d{9}').hasMatch(
                            value.toString(),
                          );
                          if (value!.length < 10 || value.isEmpty) {
                            return "Enter valid mobile Number";
                          }
                          // } else if (!dist) {
                          //   return "Enter valid number";
                          // }
                          return null;
                        },
                        placeholder: "Enter your Mobile number",
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: CSCPicker(
                        ///Enable disable state dropdown [OPTIONAL PARAMETER]
                        showStates: true,

                        /// Enable disable city drop down [OPTIONAL PARAMETER]
                        showCities: true,

                        ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                        flagState: CountryFlag.DISABLE,

                        ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),

                        ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade300,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),

                        ///placeholders for dropdown search field
                        countrySearchPlaceholder: "Country",
                        stateSearchPlaceholder: "State",
                        citySearchPlaceholder: "City",

                        ///labels for dropdown
                        countryDropdownLabel: "*Country",
                        stateDropdownLabel: "*State",
                        cityDropdownLabel: "*City",

                        ///Default Country
                        //defaultCountry: CscCountry.India,

                        ///Disable country dropdown (Note: use it with default country)
                        //disableCountry: true,

                        ///Country Filter [OPTIONAL PARAMETER]
                        countryFilter: [
                          CscCountry.India,
                          CscCountry.United_States,
                          CscCountry.Canada
                        ],

                        ///selected item style [OPTIONAL PARAMETER]
                        selectedItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                        dropdownHeadingStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),

                        ///DropdownDialog Item style [OPTIONAL PARAMETER]
                        dropdownItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///Dialog box radius [OPTIONAL PARAMETER]
                        dropdownDialogRadius: 10.0,

                        ///Search bar radius [OPTIONAL PARAMETER]
                        searchBarRadius: 10.0,

                        ///triggers once country selected in dropdown
                        onCountryChanged: (value) {
                          setState(() {
                            ///store value in country variable
                            countryValue = value;
                          });
                        },

                        ///triggers once state selected in dropdown
                        onStateChanged: (value) {
                          setState(() {
                            ///store value in state variable
                            stateValue = value.toString();
                          });
                        },

                        ///triggers once city selected in dropdown
                        onCityChanged: (value) {
                          setState(() {
                            ///store value in city variable
                            cityValue = value.toString();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: Input(
                        controller: pin,
                        type: TextInputType.number,
                        maxLength: 6,
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
                        print("city${cityValue.length},${validateForm()}");
                        if (validateForm() &&
                            cityValue.isNotEmpty &&
                            stateValue.length > 0 &&
                            countryValue.length > 0) {
                          RegistredUser user = RegistredUser(
                            name: name.text,
                            bloodGroup: dropdownValue,
                            state: stateValue,
                            pinCode: pin.text,
                            mobileNumber: mobile.text,
                          );

                          context.read<RegisteredBloc>().add(
                                AddUserEvent(
                                  user,
                                ),
                              );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Navigation(),
                            ),
                          );
                        } else {
                          showPopup(
                              context, 'Please fill all the fields correctly.');
                        }
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

bool validateForm() {
  // Perform validation for each form field
  final bool nameValid = RegExp(r"[A-Za-z]").hasMatch(name.text);
  final bool mobileValid = RegExp(r"^[6-9]\d{9}$").hasMatch(mobile.text);
  // final bool districtValid = cityValue.isNotEmpty;
  // final bool stateValid = stateValue.isNotEmpty;
  final bool pinValid = pin.text.length == 6;

  return nameValid && mobileValid && pinValid;
}

void showPopup(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
