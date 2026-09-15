import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';

class FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        width: 280,
        height: 210,
        transform: Matrix4.identity()
          ..translate(
            0.0,
            hover ? -8.0 : 0.0,
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.card.withValues(alpha: .85),
          border: Border.all(
            color: hover
                ? AppColors.primary.withValues(alpha: .6)
                : Colors.white.withValues(alpha: .05),
          ),
          boxShadow: [
            BoxShadow(
              color: hover
                  ? AppColors.primary.withValues(alpha: .18)
                  : Colors.black.withValues(alpha: .15),
              blurRadius: hover ? 35 : 15,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  ),
                  borderRadius:
                      BorderRadius.circular(18),
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),

              const Spacer(),

              Text(
                widget.title,
                style: GoogleFonts.spaceGrotesk(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.subtitle,
                style: GoogleFonts.inter(
                  color: AppColors.grey,
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}