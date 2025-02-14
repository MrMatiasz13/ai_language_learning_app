import 'package:ai_language_learning_app/features/chat/domain/entities/message_entity.dart';
import 'package:ai_language_learning_app/features/chat/presentation/widgets/message.dart';
import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: Column(
        children: [
          Message(
            message: MessageEntity(
              id: 1,
              content: 'test',
              isUserMessage: true,
            ),
          ),
          Message(
            message: MessageEntity(
              id: 2,
              content:
                  'test 2 sdamskdmsakdmancxuuajijzijaijicasjciasjcoisajcoisajcoisajoicasjoidjoidjsaoida',
              isUserMessage: false,
            ),
          ),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text('ChatBot'),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          height: 1,
        ),
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.menu_rounded),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.add_box_outlined),
        ),
      ],
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
        child: _buildTextFild(),
      ),
    );
  }

  _buildTextFild() {
    return Row(
      children: [
        Expanded(
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: _userInputController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Write something...',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 181, 181, 181),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
