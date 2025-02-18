import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/get_messages_usecase.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetMessagesUsecase _getMessagesUsecase;
  final SendMessageUsecase _sendMessageUsecase;

  ChatCubit(
    this._getMessagesUsecase,
    this._sendMessageUsecase,
  ) : super(InitialState());

  Future<List<ChatMessageEntity>> getMessages() async {
    return await _getMessagesUsecase.call();
  }

  Future<void> sendMessage(String message) async {
    await _sendMessageUsecase.call(message);
  }
}
