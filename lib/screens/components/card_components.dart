import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String? name;
  final String? mobile;
  String? blood;

  CardComponent(
    this.blood, {
    super.key,
    required this.name,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blue,
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name.toString(),
            ),
            Text(
              blood.toString(),
            ),
            Text(
              mobile.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
