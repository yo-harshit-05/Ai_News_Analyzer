import 'package:flutter/material.dart';

class HeroGraphics extends StatelessWidget {
  const HeroGraphics({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [

          Positioned(
            left: 20,
            top: 190,
            child: SizedBox(
              width: 330,
              child: Image.asset(
                "assets/images/hero_ai.png",
              ),
            ),
          ),

          Positioned(
            right: 30,
            top: 190,
            child: SizedBox(
              width: 315,
              child: Image.asset(
                "assets/images/globe_ai.png",
              ),
            ),
          ),
        ],
      ),
    );
  }
}