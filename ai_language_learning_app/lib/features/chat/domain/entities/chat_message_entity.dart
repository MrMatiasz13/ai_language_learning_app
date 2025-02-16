class ChatMessageEntity {
  final int id;
  final String content;
  final bool isUserMessage;

  ChatMessageEntity({
    required this.id,
    required this.content,
    required this.isUserMessage,
  });
}
