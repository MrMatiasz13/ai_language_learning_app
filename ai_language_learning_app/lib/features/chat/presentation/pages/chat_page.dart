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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
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
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: TextField(
                controller: controller,
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
