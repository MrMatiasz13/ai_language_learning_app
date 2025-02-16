import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';

abstract class ChatState {}

class InitialState extends ChatState {}

class UpdateState extends ChatState {
  final List<ChatMessageEntity> list;
  UpdateState(this.list);
}
