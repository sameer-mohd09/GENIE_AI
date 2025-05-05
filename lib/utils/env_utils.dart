import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvUtils {
  static Future<void> loadEnv() async {
    await dotenv.load(fileName: ".env");
  }

  static String getApiKey() {
    return dotenv.env['API_KEY'] ?? '';
  }
}
