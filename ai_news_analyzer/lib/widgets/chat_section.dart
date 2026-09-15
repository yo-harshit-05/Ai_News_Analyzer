import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/app_colors.dart';
import '../services/api_service.dart';

class ChatSection extends StatefulWidget {
  final String article;

  const ChatSection({
    super.key,
    required this.article,
  });

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  final TextEditingController controller = TextEditingController();

  bool loading = false;
  String answer = "";

  final List<String> suggestedQuestions = [
    "Summarize this article.",
    "Explain this article in simple words.",
    "What are the key points?",
    "Who are the important people mentioned?",
    "What organizations are involved?",
    "Why did this happen?",
    "What could happen next?",
    "What are the possible consequences?",
  ];

  Future<void> askAI() async {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      loading = true;
    });

    try {
      final response = await ApiService.askQuestion(
        article: widget.article,
        question: controller.text.trim(),
      );

      if (!mounted) return;

      setState(() {
        answer = response.answer;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        answer = e.toString();
      });
    }

    if (!mounted) return;

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: .05),
            Colors.white.withValues(alpha: .02),
          ],
        ),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: .25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "🤖 Ask AI",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Suggested Questions",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: suggestedQuestions.map((question) {
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: loading
                    ? null
                    : () async {
                        controller.text = question;
                        await askAI();
                      },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: .08),
                    ),
                  ),
                  child: Text(
                    question,
                    style: GoogleFonts.inter(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 22),

          TextField(
            controller: controller,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => askAI(),
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText: "Ask anything about this article...",
              hintStyle: const TextStyle(
                color: Colors.white54,
              ),
              filled: true,
              fillColor: Colors.white10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(
                  color: Colors.white.withValues(alpha: .08),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),

          const SizedBox(height: 18),

          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: loading ? null : askAI,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: loading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      "Ask AI",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),

          if (answer.isNotEmpty) ...[
            const SizedBox(height: 28),

            Text(
              "Answer",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .04),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.white.withValues(alpha: .06),
                ),
              ),
              child: Text(
                answer,
                style: GoogleFonts.inter(
                  color: Colors.white70,
                  height: 1.7,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}