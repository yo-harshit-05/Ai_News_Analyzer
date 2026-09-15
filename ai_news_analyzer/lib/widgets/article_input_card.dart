import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/api_service.dart';
import '../core/app_colors.dart';
import '../pages/analysis_page.dart';

class ArticleInputCard extends StatefulWidget {
  const ArticleInputCard({super.key});

  @override
  State<ArticleInputCard> createState() => _ArticleInputCardState();
}

class _ArticleInputCardState extends State<ArticleInputCard> {
  final TextEditingController controller = TextEditingController();
  Future<void> analyze() async {
    final input = controller.text.trim();

    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a URL or article.")),
      );
      return;
    }

    setState(() {
      loading = true;
    });

    try {
      final data = isUrl
          ? await ApiService.analyzeNews(input)
          : await ApiService.analyzeArticle(input);

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AnalysisPage(result: data)),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  bool hover = false;
  bool loading = false;

  bool get isUrl {
    final text = controller.text.trim();

    return text.startsWith("http://") || text.startsWith("https://");
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 700,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: hover
                ? AppColors.primary.withValues(alpha: .7)
                : Colors.white.withValues(alpha: .08),
          ),
          gradient: LinearGradient(
            colors: [
              Colors.white.withValues(alpha: .06),
              Colors.white.withValues(alpha: .03),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: hover ? .22 : .10),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withValues(alpha: .05),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.auto_awesome,
                              color: AppColors.cyan,
                              size: 15,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "Analyze News",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: .05),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.clear();
                          },
                          icon: const Icon(Icons.link, color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff0A1020),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: TextField(
                      controller: controller,

                      textInputAction: TextInputAction.done,

                      onSubmitted: (_) {
                        analyze();
                      },

                      expands: true,
                      maxLines: null,

                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 13,
                        height: 1.1,
                      ),

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(24),
                        hintText: "Paste a news article or paste a news URL...",
                        hintStyle: GoogleFonts.inter(
                          color: Colors.white38,
                          height: 1.5,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    children: [
                      Expanded(
                        child: _actionButton(
                          icon: Icons.upload_file_rounded,
                          title: "Upload PDF",
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: _actionButton(
                          icon: Icons.language_rounded,
                          title: "Paste URL",
                        ),
                      ),

                      const SizedBox(width: 10),

                      InkWell(
                        onTap: loading ? null : analyze,
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: const LinearGradient(
                              colors: [AppColors.primary, AppColors.secondary],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: .35),
                                blurRadius: 30,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              loading
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.auto_awesome,
                                      color: Colors.white,
                                    ),

                              const SizedBox(width: 10),

                              Text(
                                loading ? "Analyzing..." : "Analyze with AI",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .03),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: .05),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: AppColors.cyan),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Supports articles, PDFs and URLs. AI will summarize, detect sentiment, extract keywords and answer questions.",
                            style: GoogleFonts.inter(
                              color: AppColors.grey,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionButton({required IconData icon, required String title}) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withValues(alpha: .05)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.grey, size: 20),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
