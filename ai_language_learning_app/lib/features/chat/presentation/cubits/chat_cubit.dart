import 'package:ai_language_learning_app/features/chat/domain/entities/message_entity.dart';
import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(InitialState());

  List<MessageEntity> messages = [];

  Future<void> sendMessage(MessageEntity message) async {
    messages.add(message);
    emit(UpdateState(messages));
  }
}
