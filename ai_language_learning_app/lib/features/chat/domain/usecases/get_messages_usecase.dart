import 'package:ai_language_learning_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:ai_language_learning_app/features/chat/domain/repositories/database_repository.dart';

class GetMessagesUsecase {
  final DatabaseRepository _repository;

  GetMessagesUsecase(this._repository);

  Future<List<ChatMessageEntity>> call() async {
    return await _repository.getMessages();
  }
}
