import "dart:convert";

import "package:allen/secrets.dart";
import "package:http/http.dart" as http;

class OpenAIService {
  final List<Map<String, String>> messages = [];
  Future<String> isArtPromptAPI(String prompt) async {
    try {
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $openAIAPIKey",
          },
          body: jsonEncode({
            "model": "gpt-4o",
            "messages": [
              {
                "role": "user",
                "content":
                    "Does this message want to generate an AI picture, image, art or anything similar? $prompt . Simply answer with a yes or no.",
              }
            ],
          }));

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)["choices"][0]["message"]["content"];
        content = content.trim();

        if (content.toLowerCase().startsWith("yes")) {
          return await dallEAPI(prompt);
        } else {
          return await chatGPTAPI(prompt);
        }
      }
      return "An internal error occurred ";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      "role": "user",
      "content": prompt,
    });
    try {
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/chat/completions"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $openAIAPIKey",
          },
          body: jsonEncode({
            "model": "gpt-4o",
            "messages": messages,
          }));

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)["choices"][0]["message"]["content"];
        content = content.trim();
        messages.add({
          "role": "assistant",
          "content": content,
        });
        return content;
      }
      return "An internel error occurred";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> dallEAPI(String prompt) async {
    messages.add({
      "role": "user",
      "content": prompt,
    });
    try {
      final res = await http.post(
          Uri.parse("https://api.openai.com/v1/images/generations"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $openAIAPIKey",
          },
          body: jsonEncode({
            "prompt": prompt,
            "n": 1,
          }));

      if (res.statusCode == 200) {
        String imageUrl = jsonDecode(res.body)["data"][0]["url"];
        imageUrl = imageUrl.trim();
        messages.add({
          "role": "assistant",
          "content": imageUrl,
        });
        return imageUrl;
      }
      return "An internel error occurred";
    } catch (e) {
      return e.toString();
    }
  }
}
