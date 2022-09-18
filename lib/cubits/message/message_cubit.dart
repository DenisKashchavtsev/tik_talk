import 'package:bloc/bloc.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState());

  setSuccessMessage(String message) {
    emit(MessageState(message: message, success: true));
  }

  setErrorMessage(String message) {
    emit(MessageState(message: message, error: true));
  }
}
