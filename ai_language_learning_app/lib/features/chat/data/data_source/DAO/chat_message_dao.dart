import 'package:ai_language_learning_app/features/chat/data/models/chat_message_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class ChatMessageDao {
  @Insert()
  Future<void> insertMessage(ChatMessageModel message);

  @Query('SELECT * FROM chat_messages')
  Future<List<ChatMessageModel>> getMessages();
}
