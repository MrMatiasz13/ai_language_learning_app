import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(InitialState());
}
