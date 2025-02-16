import 'package:floor/floor.dart';

@Entity(tableName: 'chat_messages')
class ChatMessageModel {
  @primaryKey
  final int id;
  final String content;
  final bool isUserMessage;

  ChatMessageModel({
    required this.id,
    required this.content,
    required this.isUserMessage,
  });
}
