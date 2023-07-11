import 'package:flutter/material.dart';

class NewFile {
  final String name;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String placeholder;
  final int? maxLength;
  final TextInputType? type;

  NewFile({
    required this.name,
    required this.controller,
    this.validator,
    required this.placeholder,
    this.maxLength,
    this.type,
  });
}
