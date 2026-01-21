import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Start from top-left
    path.lineTo(0, size.height - 20);

    // First curve (left bottom)
    path.quadraticBezierTo(
      0,
      size.height,
      30,
      size.height,
    );

    // Second curve (middle bottom)
    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width - 30,
      size.height,
    );

    // Third curve (right bottom)
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - 20,
    );

    // Right edge to top-right
    path.lineTo(size.width, 0);

    // Close the shape
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; 
  }
}
