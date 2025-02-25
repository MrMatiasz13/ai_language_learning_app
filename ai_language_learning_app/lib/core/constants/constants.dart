import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final apiKey = dotenv.env['API_KEY'];
  static final aiModel = 'gemini-1.5-flash-latest';
}
