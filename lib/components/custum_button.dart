import 'package:flutter/material.dart';

class CustumButton extends StatelessWidget {
  final String buttonName;
  final double height;
  final double width;
  final Color color;
  final double radius;
  final Color textColor;
  final Function()? onTap;
  const CustumButton({
    super.key,
    required this.buttonName,
    required this.height,
    required this.width,
    required this.color,
    required this.radius,
    required this.textColor,
    required this.onTap(),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            radius,
          ),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
