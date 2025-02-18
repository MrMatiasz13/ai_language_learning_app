class ChatMessageEntity {
  int? id;
  final String content;
  final bool isUserMessage;

  ChatMessageEntity({
    this.id,
    required this.content,
    required this.isUserMessage,
  });
}
