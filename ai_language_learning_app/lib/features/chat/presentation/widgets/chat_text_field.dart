import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? sendMessageVoid;

  const ChatTextField({
    super.key,
    required this.controller,
    this.sendMessageVoid,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: TextField(
                controller: controller,
                autofocus: true,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Write something...',
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(255, 181, 181, 181),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: sendMessageVoid,
          icon: Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
