import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int hovered = -1;

  final menus = const [
    "Features",
    "How it Works",
    "Pricing",
    "Docs",
    "GitHub",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 35,
        right: 35,
        top: 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 30,
            sigmaY: 30,
          ),
          child: Container(
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .04),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withValues(alpha: .08),
              ),
            ),
            child: Row(
              children: [
                //---------------------------------------

                const Icon(
                  Icons.auto_awesome,
                  color: AppColors.primary,
                  size: 34,
                ),

                const SizedBox(width: 15),

                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "AI ",
                        style: GoogleFonts.spaceGrotesk(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "News",
                        style: GoogleFonts.spaceGrotesk(
                          color: AppColors.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                //---------------------------------------

                for (int i = 0; i < menus.length; i++)
                  MouseRegion(
                    onEnter: (_) {
                      setState(() => hovered = i);
                    },
                    onExit: (_) {
                      setState(() => hovered = -1);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: hovered == i
                            ? Colors.white.withValues(alpha: .06)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        menus[i],
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: hovered == i
                              ? Colors.white
                              : AppColors.grey,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(width: 20),

                //---------------------------------------

                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {},
                  child: Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xff2563EB),
                          Color(0xff7C3AED),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withValues(alpha: .35),
                          blurRadius: 25,
                        )
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 16,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            "Get Started",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}