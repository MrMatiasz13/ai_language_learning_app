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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        scrollDown();
      }
    });
  }

  @override
  void dispose() {
    _userInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // scrolls list view to bottom
  void scrollDown() {
    if (_scrollController.hasClients) {
      final maxExtent = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      print(
          'Max Scroll Extent: $maxExtent, Current Position: $currentPosition');

      if (currentPosition < maxExtent) {
        _scrollController
            .animateTo(
          maxExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        )
            .then((_) {
          if (_scrollController.position.pixels <
              _scrollController.position.maxScrollExtent) {
            scrollDown();
          }
        });
      } else {
        print('ScrollController not attached yet');
      }
    }
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
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
        if (state is DoneState) {
          scrollDown();
        }
      },
      builder: (context, state) {
        if (state is DoneState) {
          return ListView.builder(
            controller: _scrollController,
            itemCount: state.messageList.length,
            itemBuilder: (context, index) => Message(
              chatMessageEntity: ChatMessageEntity(
                content: state.messageList[index].content,
                isUserMessage: state.messageList[index].isUserMessage,
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
      sendMessageVoid: () => scrollDown(),
    );
  }
}
