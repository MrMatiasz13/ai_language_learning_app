import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_cubit.dart';
import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_state.dart';
import 'package:ai_language_learning_app/features/chat/presentation/widgets/app_bar.dart';
import 'package:ai_language_learning_app/features/chat/presentation/widgets/chat_text_field.dart';
import 'package:ai_language_learning_app/features/chat/presentation/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _userInputController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().fetchMessages();
  }

  @override
  void dispose() {
    _userInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void sendMessage(ChatMessageEntity message) async {
    await context.read<ChatCubit>().sendMessage(message);
  }

  void chatWithAI() async {
    final userPrompt = _userInputController.text;

    final userMessage = ChatMessageEntity(
      content: userPrompt,
      isUserMessage: true,
    );

    sendMessage(userMessage);
    _userInputController.clear();

    final answer = await context.read<ChatCubit>().getAIAnswer(userPrompt);
    sendMessage(answer);
  }

  Future<ChatMessageEntity> getAnswer() async {
    return await context
        .read<ChatCubit>()
        .getAIAnswer(_userInputController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Aplicationbar(title: const Text('ChatBot')),
      body: Column(
        children: [
          // chat list view
          Expanded(child: _buildChatList()),

          // user input
          _buildUserInput(),
        ],
      ),
    );
  }

  _buildChatList() {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is DoneState) {
          return ListView.builder(
            reverse: true,
            controller: _scrollController,
            itemCount: state.messageList.length,
            itemBuilder: (context, index) => Message(
              chatMessageEntity: ChatMessageEntity(
                content: state
                    .messageList[state.messageList.length - 1 - index].content,
                isUserMessage: state
                    .messageList[state.messageList.length - 1 - index]
                    .isUserMessage,
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  _buildUserInput() {
    return ChatTextField(
      controller: _userInputController,
      sendMessageVoid: () => chatWithAI(),
    );
  }
}
