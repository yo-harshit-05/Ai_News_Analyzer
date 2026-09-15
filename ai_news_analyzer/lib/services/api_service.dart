import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/api_config.dart';
import '../models/analyze_response.dart';
import '../models/chat_response.dart';

class ApiService {
  static const Duration timeout = Duration(seconds: 30);

  /// Analyze News URL
  static Future<AnalyzeResponse> analyzeNews(String url) async {
    try {
      final response = await http
          .post(
            Uri.parse("${ApiConfig.baseUrl}/analyze/"),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "url": url,
            }),
          )
          .timeout(timeout);

      if (response.statusCode == 200) {
        return AnalyzeResponse.fromJson(
          jsonDecode(response.body),
        );
      }

      throw Exception(
        "Server Error (${response.statusCode})\n${response.body}",
      );
    } on TimeoutException {
      throw Exception(
        "Request timed out. Please check your internet connection.",
      );
    } catch (e) {
      throw Exception("Unable to connect to backend.\n$e");
    }
  }

  /// Analyze Pasted Article
  static Future<AnalyzeResponse> analyzeArticle(String article) async {
    try {
      final response = await http
          .post(
            Uri.parse("${ApiConfig.baseUrl}/analyze/text"),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "article": article,
            }),
          )
          .timeout(timeout);

      if (response.statusCode == 200) {
        return AnalyzeResponse.fromJson(
          jsonDecode(response.body),
        );
      }

      throw Exception(
        "Server Error (${response.statusCode})\n${response.body}",
      );
    } on TimeoutException {
      throw Exception(
        "Request timed out. Please check your internet connection.",
      );
    } catch (e) {
      throw Exception("Unable to connect to backend.\n$e");
    }
  }

  /// Ask AI Questions
  static Future<ChatResponse> askQuestion({
    required String article,
    required String question,
  }) async {
    try {
      final response = await http
          .post(
            Uri.parse("${ApiConfig.baseUrl}/chat/"),
            headers: {
              "Content-Type": "application/json",
            },
            body: jsonEncode({
              "article": article,
              "question": question,
            }),
          )
          .timeout(timeout);

      if (response.statusCode == 200) {
        return ChatResponse.fromJson(
          jsonDecode(response.body),
        );
      }

      throw Exception(
        "Server Error (${response.statusCode})\n${response.body}",
      );
    } on TimeoutException {
      throw Exception(
        "Request timed out. Please check your internet connection.",
      );
    } catch (e) {
      throw Exception("Unable to connect to backend.\n$e");
    }
  }
}