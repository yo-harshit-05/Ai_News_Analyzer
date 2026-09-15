import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class AIDashboardCard extends StatelessWidget {
  const AIDashboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card.withValues(alpha: .85),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: Colors.white.withValues(alpha: .08),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: .08),
            blurRadius: 40,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [

              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary,
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.auto_awesome,
                  color: Colors.white,
                ),
              ),

              const SizedBox(width: 15),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "AI Analysis",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 3),

                  Text(
                    "Ready to analyze",
                    style: TextStyle(
                      color: AppColors.grey,
                    ),
                  )
                ],
              )
            ],
          ),

          const SizedBox(height: 28),

          buildProgress(
            "Summary",
            0.96,
            Colors.blue,
          ),

          const SizedBox(height: 18),

          buildProgress(
            "Sentiment",
            0.82,
            Colors.green,
          ),

          const SizedBox(height: 18),

          buildProgress(
            "Keywords",
            0.91,
            Colors.orange,
          ),

          const SizedBox(height: 18),

          buildProgress(
            "Entities",
            0.74,
            Colors.purple,
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              stat("98%", "Accuracy"),

              stat("2.1s", "Speed"),

              stat("AI", "Powered"),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProgress(
      String title,
      double value,
      Color color,
      ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),

            Text(
              "${(value * 100).toInt()}%",
              style: const TextStyle(
                color: AppColors.grey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        ClipRRect(
          borderRadius:
              BorderRadius.circular(20),
          child: LinearProgressIndicator(
            minHeight: 8,
            value: value,
            backgroundColor:
                Colors.white10,
            valueColor:
                AlwaysStoppedAnimation(color),
          ),
        )
      ],
    );
  }

  Widget stat(
      String value,
      String title,
      ) {
    return Column(
      children: [

        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: const TextStyle(
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}