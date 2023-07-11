import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const style = TextStyle(
  color: Colors.black,
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

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
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 6.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                2.0, // Move to right 2  horizontally
                2.0, // Move to bottom 2 Vertically
              ),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.toString(),
                  style: style,
                ),
                Text(
                  blood.toString(),
                  style: style,
                ),
                Text(
                  mobile.toString(),
                  style: style,
                ),
              ],
            ),
            IconButton(
              // ignore: deprecated_member_use
              onPressed: () => launch(
                "tel://${mobile}",
              ),
              icon: const Icon(
                Icons.call,
              ),
            )
          ],
        ),
      ),
    );
  }
}
