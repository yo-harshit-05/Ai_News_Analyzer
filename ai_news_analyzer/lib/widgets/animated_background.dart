import 'dart:ui';

import 'package:flutter/material.dart';


class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        //------------------------------------------------

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [

                Color(0xff050816),

                Color(0xff090B18),

                Color(0xff050816),
              ],
            ),
          ),
        ),

        //------------------------------------------------

        CustomPaint(
          size: Size.infinite,
          painter: GridPainter(),
        ),

        //------------------------------------------------

        Positioned(
          left: -180,
          top: -180,
          child: glow(
            420,
            const Color(0xff2563EB),
          ),
        ),

        Positioned(
          right: -200,
          top: 150,
          child: glow(
            500,
            const Color(0xff7C3AED),
          ),
        ),

        Positioned(
          bottom: -220,
          left: 250,
          child: glow(
            420,
            Colors.cyan,
          ),
        ),

      ],
    );
  }

  Widget glow(
      double size,
      Color color,
      ) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 130,
        sigmaY: 130,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withValues(alpha: .18),
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(
      Canvas canvas,
      Size size,
      ) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: .04)
      ..strokeWidth = .8;

    const gap = 40.0;

    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        paint,
      );
    }

    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}