import 'package:google_generative_ai/google_generative_ai.dart';

class AIRemoteDataSource {
  final GenerativeModel _aiModel;

  AIRemoteDataSource(String apikey, String model)
      : _aiModel = GenerativeModel(
          model: model,
          apiKey: apikey,
        );

  Future<String> fetchAIResponse(String prompt) async {
    try {
      final response = await _aiModel.generateContent([Content.text(prompt)]);
      return response.text ?? 'Empty response';
    } catch (e) {
      throw Exception('Ai model exception: $e');
    }
  }
}
