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

  @override
  void dispose() {
    _userInputController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().fetchMessages();
  }

  void _sendMessage(ChatMessageEntity message) async {
    await context.read<ChatCubit>().sendMessage(message);
  }

  Future<ChatMessageEntity> _getAIAnswer(String prompt) async {
    final answer = await context.read<ChatCubit>().getAIAnswer(prompt);

    return answer;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Aplicationbar(
        title: Text('ChatBot'),
      ),
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _buildListView(),
    );
  }

  _buildBottomNavigationBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
        child: ChatTextField(
          controller: _userInputController,
          sendMessageVoid: () async {
            final userPrompt = _userInputController.text;

            final userMessage = ChatMessageEntity(
              content: userPrompt,
              isUserMessage: true,
            );
            _sendMessage(userMessage);
            _userInputController.clear();

            final answer = await _getAIAnswer(userPrompt);
            _sendMessage(answer);

            _userInputController.clear();
          },
        ),
      ),
    );
  }

  _buildListView() {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is DoneState) {
          return ListView.builder(
            itemCount: state.messageList.length,
            itemBuilder: (context, index) => Message(
              chatMessageEntity: ChatMessageEntity(
                content: state.messageList[index].content,
                isUserMessage: state.messageList[index].isUserMessage,
              ),
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
