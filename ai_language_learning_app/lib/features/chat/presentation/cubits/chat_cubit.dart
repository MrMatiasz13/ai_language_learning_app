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

  Future<void> fetchMessages() async {
    emit(LoadingState());
    final messages = await _getMessagesUsecase.call();
    emit(DoneState(messages));
  }

  Future<void> sendMessage(String message) async {
    emit(LoadingState());
    await _sendMessageUsecase.call(message);
    final messages = await _getMessagesUsecase.call();
    emit(DoneState(messages));
  }
}
