import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final controller;
  final String? Function(String?)? validator;
  final String placeholder;
  const Input({
    super.key,
    required this.controller,
    this.validator,
    required this.placeholder,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String? errorText;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      margin: EdgeInsets.only(
        bottom: 23,
      ),
      child: TextFormField(
        validator: widget.validator,
        // textAlignVertical: TextAlignVertical.center,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          errorText: errorText,
          hintText: widget.placeholder,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
        onChanged: (value) {
          setState(() {
            errorText = widget.validator?.call(value);
          });
        },
      ),
    );
  }
}
