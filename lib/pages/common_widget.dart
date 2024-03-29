import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(4, (index) {
        return Icon(
          Icons.star,
          color: Colors.white,
          size: 16,
        );
      }),
    );
  }
}
