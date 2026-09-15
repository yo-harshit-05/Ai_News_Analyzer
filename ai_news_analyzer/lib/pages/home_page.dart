import 'package:flutter/material.dart';

import '../widgets/animated_background.dart';
import '../widgets/hero_section.dart';
import '../widgets/navbar.dart';
import '../widgets/feature_section.dart';
import '../widgets/hero_graphics.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(),

   HeroGraphics(),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Navbar(),
                  SizedBox(height: 50),
                  HeroSection(),
FeatureSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}