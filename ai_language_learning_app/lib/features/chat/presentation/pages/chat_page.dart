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
      backgroundColor: Theme.of(context).colorScheme.surface,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(24),
          ),
          child: _buildBottomTextFild(_userInputController),
        ),
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

  _buildBottomTextFild(TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Write something...',
              hintStyle: TextStyle(
                color: const Color.fromARGB(255, 181, 181, 181),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8.0,
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
