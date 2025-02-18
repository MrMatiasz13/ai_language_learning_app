import 'package:ai_language_learning_app/features/chat/domain/repositories/database_repository.dart';

class SendMessageUsecase {
  final DatabaseRepository _repository;

  SendMessageUsecase(this._repository);

  Future<void> call(String message) async {
    await _repository.sendMessage(message);
  }
}
