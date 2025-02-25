import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';

abstract class DatabaseRepository {
  Future<void> sendMessage(ChatMessageEntity messageEntity);
  Future<List<ChatMessageEntity>> getMessages();
}
