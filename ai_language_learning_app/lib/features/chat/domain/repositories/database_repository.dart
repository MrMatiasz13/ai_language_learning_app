abstract class DatabaseRepository {
  Future<void> sendMessage(String message);
  Future<List<ChatMessageEntity>> getMessages();
}
