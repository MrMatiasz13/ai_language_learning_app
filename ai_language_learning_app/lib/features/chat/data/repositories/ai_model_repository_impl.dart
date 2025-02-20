import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/domain/repositories/ai_model_repository.dart';

class AIModelRepositoryImpl implements AIModelRepository {
  @override
  Future<ChatMessageEntity> generateAnswer(String prompt) {
    // TODO: implement generateAnswer
    throw UnimplementedError();
  }
}
