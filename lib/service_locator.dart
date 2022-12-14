import 'repositories/auth_repository.dart';
import 'repositories/chat_repository.dart';
import 'repositories/user_repository.dart';

class ServiceLocator {
  AuthRepository get authRepository => AuthRepository();
  ChatRepository get chatRepository => ChatRepository();
  UserRepository get userRepository => UserRepository();
}