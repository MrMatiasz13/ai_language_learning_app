import 'package:ai_language_learning_app/core/constants/constants.dart';
import 'package:ai_language_learning_app/features/chat/data/data_source/local/app_database.dart';
import 'package:ai_language_learning_app/features/chat/data/data_source/remote/ai_remote_data_source.dart';
import 'package:ai_language_learning_app/features/chat/data/repositories/ai_model_repository_impl.dart';
import 'package:ai_language_learning_app/features/chat/data/repositories/database_repository_impl.dart';
import 'package:ai_language_learning_app/features/chat/domain/repositories/ai_model_repository.dart';
import 'package:ai_language_learning_app/features/chat/domain/repositories/database_repository.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/get_ai_answer_usecase.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/get_messages_usecase.dart';
import 'package:ai_language_learning_app/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:ai_language_learning_app/features/chat/presentation/cubits/chat_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // .env
  await dotenv.load(fileName: ".env");

  // local database
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // remote data source
  sl.registerSingleton<AIRemoteDataSource>(
    AIRemoteDataSource(Constants.apiKey!, Constants.aiModel),
  );

  // repository
  sl.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(sl()),
  );
  sl.registerSingleton<AIModelRepository>(
    AIModelRepositoryImpl(sl()),
  );

  // usecase
  sl.registerSingleton<GetMessagesUsecase>(
    GetMessagesUsecase(sl()),
  );
  sl.registerSingleton<SendMessageUsecase>(
    SendMessageUsecase(sl()),
  );
  sl.registerSingleton<GetAiAnswerUseCase>(
    GetAiAnswerUseCase(sl()),
  );

  // cubit
  sl.registerFactory<ChatCubit>(
    () => ChatCubit(sl(), sl(), sl()),
  );
}
