import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final String image;
  final String label;
  final double? width;
  final Widget sizedBox;
  const ReusableRow({
    super.key,
    required this.image,
    required this.label,
    this.width,
    required this.sizedBox,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, color: Colors.white, width: width),
        sizedBox,
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
