import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final ChatMessageEntity chatMessageEntity;

  const Message({
    super.key,
    required this.chatMessageEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: chatMessageEntity.isUserMessage
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: chatMessageEntity.isUserMessage
                  ? Colors.grey.shade600
                  : Colors.grey.shade800,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Text(
              chatMessageEntity.content,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
