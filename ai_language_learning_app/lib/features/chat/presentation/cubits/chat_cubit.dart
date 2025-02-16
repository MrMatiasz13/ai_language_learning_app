import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(InitialState());

  List<ChatMessageEntity> messages = [];

  Future<void> sendMessage(ChatMessageEntity message) async {
    messages.add(message);
    emit(UpdateState(messages));
  }
}
