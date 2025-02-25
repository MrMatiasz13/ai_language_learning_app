import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/domain/repositories/ai_model_repository.dart';

class GetAiAnswerUseCase {
  final AIModelRepository _repository;

  GetAiAnswerUseCase(this._repository);

  Future<ChatMessageEntity> call(String prompt) async {
    return await _repository.generateAnswer(prompt);
  }
}
