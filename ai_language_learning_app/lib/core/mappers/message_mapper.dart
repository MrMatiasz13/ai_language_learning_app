import 'package:ai_language_learning_app/features/chat/data/models/chat_message_model.dart';
import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';

extension ChatMessageModelMapper on ChatMessageModel {
  ChatMessageEntity toEntity() {
    return ChatMessageEntity(
      id: id,
      content: content,
      isUserMessage: isUserMessage,
    );
  }
}

extension ChatMessageEntityMapper on ChatMessageEntity {
  ChatMessageModel toModel() {
    return ChatMessageModel(
      id: id,
      content: content,
      isUserMessage: isUserMessage,
    );
  }
}
