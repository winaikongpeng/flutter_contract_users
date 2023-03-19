import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription<ConnectivityResult>? subscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if (event is OnConnected) {
        emit(Connected(message: 'Internet connected'));
      } else if (event is OnNotConnected) {
        emit(Connected(message: 'Internet not connected'));
      }
    });

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(OnConnected());
      } else {
        add(OnNotConnected());
      }
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
