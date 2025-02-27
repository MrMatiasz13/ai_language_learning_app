import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/get_ai_answer_usecase.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/get_messages_usecase.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetMessagesUsecase _getMessagesUsecase;
  final SendMessageUsecase _sendMessageUsecase;
  final GetAiAnswerUseCase _getAiAnswerUseCase;

  ChatCubit(
    this._getMessagesUsecase,
    this._sendMessageUsecase,
    this._getAiAnswerUseCase,
  ) : super(InitialState());

  Future<void> fetchMessages() async {
    emit(LoadingState());
    final messages = await _getMessagesUsecase.call();
    emit(DoneState(messages));
  }

  Future<void> sendMessage(ChatMessageEntity message) async {
    emit(LoadingState());

    if (state is DoneState) {
      final currentMessages = (state as DoneState).messageList;
      emit(DoneState([...currentMessages, message]));
    }

    await _sendMessageUsecase.call(message);
    final messages = await _getMessagesUsecase.call();
    emit(DoneState(messages));
  }

  Future<ChatMessageEntity> getAIAnswer(String prompt) async {
    return await _getAiAnswerUseCase.call(prompt);
  }
}
