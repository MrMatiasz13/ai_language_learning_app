import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';

abstract class ChatState {}

class InitialState extends ChatState {}

class LoadingState extends ChatState {}

class DoneState extends ChatState {
  final List<ChatMessageEntity> messageList;

  DoneState(this.messageList);
}
