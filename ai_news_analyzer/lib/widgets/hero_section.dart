import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';
import 'article_input_card.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: Column(
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withValues(alpha: .05),
              border: Border.all(
                color: Colors.white.withValues(alpha: .08),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.bolt,
                  color: Colors.amber,
                  size: 18,
                ),
                SizedBox(width: 6),
                Text(
                  "Powered by NLP + LLM Technology",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Heading
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.spaceGrotesk(
                fontSize: 51,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
              children: [
                const TextSpan(text: "Understand Every\n"),
                TextSpan(
                  text: "News Story",
                  style: TextStyle(
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [
                          Color(0xff4F7CFF),
                          Color(0xff8B5CF6),
                        ],
                      ).createShader(
                        const Rect.fromLTWH(0, 0, 400, 80),
                      ),
                  ),
                ),
                const TextSpan(text: " Instantly"),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // Description
          SizedBox(
            width: 520,
            child: Text(
              "Summarize, analyze sentiment, extract keywords, identify named entities and ask intelligent questions using advanced AI.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.grey,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 35),

          // Quick Action Buttons
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // We'll connect this later
                },
                icon: const Icon(Icons.link),
                label: const Text("Analyze URL"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  // We'll connect this later
                },
                icon: const Icon(Icons.article_outlined),
                label: const Text("Paste Article"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(
                    color: Colors.white.withValues(alpha: .2),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // AI Features
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: const [
              _FeatureChip(
                icon: Icons.summarize,
                title: "AI Summary",
              ),
              _FeatureChip(
                icon: Icons.sentiment_satisfied_alt,
                title: "Sentiment",
              ),
              _FeatureChip(
                icon: Icons.key,
                title: "Keywords",
              ),
              _FeatureChip(
                icon: Icons.account_tree,
                title: "Named Entities",
              ),
              _FeatureChip(
                icon: Icons.chat_bubble_outline,
                title: "AI Chat",
              ),
            ],
          ),

          const SizedBox(height: 55),

          // Analyzer
          const ArticleInputCard(),
        ],
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String title;

  const _FeatureChip({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white.withValues(alpha: .08),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: AppColors.cyan,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}