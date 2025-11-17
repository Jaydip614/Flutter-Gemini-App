import 'package:flutter/material.dart';
import 'dart:ui' as ui; // Import ui for ui.Gradient
import 'dart:math' as math; // Import dart:math for math.pi

class GeminiLogo extends StatelessWidget {
  const GeminiLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(32, 32), // Keeping the original size from the context
      painter: GeminiLogoPainter(),
    );
  }
}

class GeminiLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final Path path = Path();

    // Define the main points of the diamond/star shape
    // These are the extreme points of the shape
    final Offset topPoint = Offset(width / 2, 0);
    final Offset rightPoint = Offset(width, height / 2);
    final Offset bottomPoint = Offset(width / 2, height);
    final Offset leftPoint = Offset(0, height / 2);

    // Starting from the top point
    path.moveTo(topPoint.dx, topPoint.dy);

    // Draw the curves connecting the points to create rounded, outward-bulging edges
    // From Top to Right
    path.quadraticBezierTo(
      width * 0.9, height * 0.1, // Control point for outward curve
      rightPoint.dx, rightPoint.dy,
    );

    // From Right to Bottom
    path.quadraticBezierTo(
      width * 0.9, height * 0.9, // Control point for outward curve
      bottomPoint.dx, bottomPoint.dy,
    );

    // From Bottom to Left
    path.quadraticBezierTo(
      width * 0.1, height * 0.9, // Control point for outward curve
      leftPoint.dx, leftPoint.dy,
    );

    // From Left to Top (closing the path)
    path.quadraticBezierTo(
      width * 0.1, height * 0.1, // Control point for outward curve
      topPoint.dx, topPoint.dy,
    );

    path.close();

    // Define the gradient
    final Paint paint = Paint()
      ..shader = ui.Gradient.sweep(
        Offset(width / 2, height / 2), // Center of the sweep gradient
        <Color>[
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.yellow,
          Colors.red, // Complete the loop
        ],
        <double>[
          0.0, // Red starts at the beginning
          0.25, // Blue at 90 degrees
          0.5, // Green at 180 degrees
          0.75, // Yellow at 270 degrees
          1.0, // Red at 360 degrees
        ],
        TileMode.clamp,
        -math.pi / 2, // Start angle: -90 degrees (top)
        3 * math.pi / 2, // End angle: 270 degrees (making a full 360-degree sweep from -90 to 270)
      )
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // The logo is static, so no repaint needed
  }
}
