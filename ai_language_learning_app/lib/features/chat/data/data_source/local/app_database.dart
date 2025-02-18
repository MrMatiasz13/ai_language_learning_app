import 'package:ai_language_learning_app/features/chat/data/data_source/local/DAO/chat_message_dao.dart';
import '../../models/chat_message_model.dart';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [ChatMessageModel])
abstract class AppDatabase extends FloorDatabase {
  ChatMessageDao get chatMessageDao;
}
