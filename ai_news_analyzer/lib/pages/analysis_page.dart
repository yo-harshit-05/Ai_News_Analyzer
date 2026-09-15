import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../core/app_colors.dart';
import '../models/analyze_response.dart';
import '../widgets/chat_section.dart';

class AnalysisPage extends StatelessWidget {
  final AnalyzeResponse result;

  const AnalysisPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1020),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "AI Analysis Dashboard",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff09111F), Color(0xff111B30), Color(0xff09111F)],
          ),
        ),

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Powered by AI",
                style: GoogleFonts.inter(
                  color: AppColors.cyan,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Comprehensive News Intelligence",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Summaries, sentiment, keywords and named entities generated in seconds.",
                style: GoogleFonts.inter(color: Colors.white60, fontSize: 15),
              ),

              const SizedBox(height: 35),
              Row(
                children: [
                  Expanded(
                    child: _statCard(
                      Icons.article_outlined,
                      "Words",
                      result.article.split(" ").length.toString(),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _statCard(
                      Icons.schedule,
                      "Reading",
                      "${(result.article.split(" ").length / 200).ceil()} min",
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _statCard(
                      Icons.text_fields,
                      "Characters",
                      result.article.length.toString(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _buildInsightsCard(),

              const SizedBox(height: 30),

              _buildCard(
                title: "📰 AI Summary",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.copy, color: Colors.white70),
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: result.summary),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Summary copied")),
                          );
                        },
                      ),
                    ),

                    Text(
                      result.summary,
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _buildCard(
                title: "😊 Sentiment",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          result.sentiment["label"],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "${(result.sentiment["confidence"] * 100).toStringAsFixed(1)}%",
                          style: GoogleFonts.poppins(
                            color: AppColors.cyan,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    LinearProgressIndicator(
                      value: result.sentiment["confidence"],
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(20),
                      backgroundColor: Colors.white12,
                      valueColor: const AlwaysStoppedAnimation(
                        AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _buildCard(
                title: "🏷 Keywords",
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: result.keywords.map((keyword) {
                    final text = keyword is Map
                        ? keyword["keyword"].toString()
                        : keyword.toString();

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.primary, AppColors.secondary],
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: .30),
                            blurRadius: 15,
                          ),
                        ],
                      ),
                      child: Text(
                        text,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              _buildCard(
                title: "👤 Named Entities",
                child: Column(
                  children: result.entities.entries.map((entity) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .04),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: .08),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: .15),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.account_tree,
                              color: AppColors.cyan,
                            ),
                          ),

                          const SizedBox(width: 16),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  entity.key,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Text(
                                  entity.value.toString(),
                                  style: GoogleFonts.inter(
                                    color: Colors.white70,
                                    height: 1.6,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              _buildCard(
                title: "📄 Full Article",
                child: Text(
                  result.article,
                  style: GoogleFonts.inter(color: Colors.white60, height: 1.7),
                ),
              ),
              const SizedBox(height: 20),

ChatSection(
  article: result.article,
),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: .06),
            Colors.white.withValues(alpha: .03),
          ],
        ),
        borderRadius: BorderRadius.circular(28),

        border: Border.all(color: AppColors.primary.withValues(alpha: .25)),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 15),

          child,
        ],
      ),
    );
  }

  Widget _statCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: .08)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.cyan, size: 28),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(title, style: GoogleFonts.inter(color: Colors.white60)),
        ],
      ),
    );
  }

  Widget _buildInsightsCard() {
    final words = result.article.split(" ").length;

    final readingTime = (words / 200).ceil();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: .15),
            AppColors.secondary.withValues(alpha: .08),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.primary.withValues(alpha: .25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_awesome, color: AppColors.cyan),

              const SizedBox(width: 10),

              Text(
                "AI Insights",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _insightRow(Icons.menu_book, "Reading Time", "$readingTime min"),

          _insightRow(Icons.text_fields, "Words", words.toString()),

          _insightRow(
            Icons.sentiment_satisfied_alt,
            "Sentiment",
            result.sentiment["label"],
          ),

          _insightRow(Icons.tag, "Keywords", result.keywords.length.toString()),

          _insightRow(
            Icons.account_tree,
            "Entity Types",
            result.entities.length.toString(),
          ),
        ],
      ),
    );
  }

  Widget _insightRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Icon(icon, color: AppColors.cyan),

          const SizedBox(width: 15),

          Expanded(
            child: Text(title, style: GoogleFonts.inter(color: Colors.white70)),
          ),

          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
