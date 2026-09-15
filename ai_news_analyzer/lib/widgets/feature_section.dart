import 'package:flutter/material.dart';

import 'feature_card.dart';

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 80,
      ),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        alignment: WrapAlignment.center,
        children: const [

          FeatureCard(
            icon: Icons.summarize_rounded,
            title: "AI Summary",
            subtitle:
                "Generate concise summaries of long news articles instantly.",
          ),

          FeatureCard(
            icon: Icons.sentiment_satisfied_alt,
            title: "Sentiment",
            subtitle:
                "Detect positive, negative and neutral sentiment with AI.",
          ),

          FeatureCard(
            icon: Icons.key_rounded,
            title: "Keywords",
            subtitle:
                "Extract important keywords and named entities automatically.",
          ),

          FeatureCard(
            icon: Icons.smart_toy_outlined,
            title: "Ask AI",
            subtitle:
                "Chat with the article and ask questions using LLMs.",
          ),
        ],
      ),
    );
  }
}