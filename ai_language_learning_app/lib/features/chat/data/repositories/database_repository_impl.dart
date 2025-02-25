import 'package:ai_language_learning_app/core/mappers/message_mapper.dart';
import 'package:ai_language_learning_app/features/chat/data/data_source/local/app_database.dart';
import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/domain/repositories/database_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class DatabaseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;

  DatabaseRepositoryImpl(this._appDatabase);

  @override
  Future<List<ChatMessageEntity>> getMessages() async {
    final messageModelList = await _appDatabase.chatMessageDao.getMessages();
    return messageModelList.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> sendMessage(ChatMessageEntity messageEntity) async {
    try {
      final messageModel = messageEntity.toModel();

      await _appDatabase.chatMessageDao.insertMessage(messageModel);
    } catch (e) {
      if (kDebugMode) {
        print('Error inserting message: $e');
      }

      throw Exception('Failed to insert message: $e');
    }
  }
}
