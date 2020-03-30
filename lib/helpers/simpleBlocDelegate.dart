import 'package:bloc/bloc.dart';

class SimpleBlocDelegate extends BlocDelegate { 
  @override 
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('bloc: ${bloc.runtimeType}, event: $event');
  }

  @override 
  void onTransition(Bloc bloc, Transition transition) {
    super.onEvent(bloc, transition);
    print('bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override 
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    onError(bloc, error, stackTrace);
    print('bloc: ${bloc.runtimeType}, error: $error');
  }
}