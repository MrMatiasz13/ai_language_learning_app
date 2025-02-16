import 'package:ai_language_learning_app/features/chat/domain/entities/message_entity.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({
    super.key,
    required this.message,
  });

  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: message.isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: message.isUserMessage
                  ? Colors.grey.shade600
                  : Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              message.content,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
