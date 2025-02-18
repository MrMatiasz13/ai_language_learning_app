import 'package:floor/floor.dart';

@Entity(tableName: 'chat_messages')
class ChatMessageModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String content;
  final bool isUserMessage;

  ChatMessageModel({
    this.id,
    required this.content,
    required this.isUserMessage,
  });
}
