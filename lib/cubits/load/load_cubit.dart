import 'package:bloc/bloc.dart';

part 'load_state.dart';

class LoadCubit extends Cubit<bool> {
  LoadCubit() : super(false);

  setLoad(bool status) {
    emit(status);
  }
}
