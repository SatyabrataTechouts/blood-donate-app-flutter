import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const style = TextStyle(
  color: Colors.white,
  fontSize: 17,
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
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.6),
          boxShadow: [
            BoxShadow(
              // color: Colors.blueGrey,
              blurRadius: 4, // soften the shadow
              spreadRadius: 0.32, //extend the shadow
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${name.toString()}',
                    style: style,
                  ),
                  Text(
                    "Blood Group: ${blood.toString()}",
                    style: style,
                  ),
                  Text(
                    "Mobile Number: ${mobile.toString()}",
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
                  color: Colors.white,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
