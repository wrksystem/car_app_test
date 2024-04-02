import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  final String imagePath;
  final double borderRadius;

  const RoundedImageWidget({
    Key? key,
    required this.imagePath,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
