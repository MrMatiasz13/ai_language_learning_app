import 'package:ai_language_learning_app/core/mappers/message_mapper.dart';
import 'package:ai_language_learning_app/features/chat/data/data_source/remote/ai_remote_data_source.dart';
import 'package:ai_language_learning_app/features/chat/data/models/chat_message_model.dart';
import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/domain/repositories/ai_model_repository.dart';

class AIModelRepositoryImpl implements AIModelRepository {
  final AIRemoteDataSource _aiDataSource;

  AIModelRepositoryImpl(this._aiDataSource);

  @override
  Future<ChatMessageEntity> generateAnswer(String prompt) async {
    final aiResponse = await _aiDataSource.fetchAIResponse(prompt);

    final ChatMessageEntity aiMessage = ChatMessageModel(
      content: aiResponse,
      isUserMessage: false,
    ).toEntity();

    return aiMessage;
  }
}
