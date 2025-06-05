import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  final String image;
  final String label;
  const ReusableRow({
    super.key,
    required this.image,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, color: Colors.white),
        const SizedBox(width: 5),
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
