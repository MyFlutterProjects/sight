import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabali/repository/devotionRepo.dart';
import 'package:kabali/repository/repository.dart';


// Event 
class DevotionEvent extends Equatable { 
  @override 
  List<Object> get props =>[];
}

class PostDevotionEvent extends DevotionEvent { 
  final _title;
  final _body;

  PostDevotionEvent(this._title, this._body);

  @override 
  List<Object> get props => [_title, _body];

}



// State
class PostDevotionState extends Equatable {
  @override 
  List<Object> get props => [];
}


class NotPostedYet extends PostDevotionState {}

class PostingDevotion extends PostDevotionState {}

// class PostedADevotion extends PostDevotionState {} 

class PostedDevotionState extends PostDevotionState { 
  final  String _response;
  PostedDevotionState(this._response);
  @override 
  List<Object> get props => [_response];
}

class FailedToPostDevotion extends PostDevotionState {}

// BLOC 
class DevotionBloc extends Bloc<DevotionEvent, PostDevotionState> { 
  DevotionRepo devotionRepo;
  // Repository _repository;

  DevotionBloc(this.devotionRepo);

  @override 
  PostDevotionState get initialState => NotPostedYet();

  @override 
  Stream<PostDevotionState> mapEventToState(DevotionEvent event) async* { 
    if (event is PostDevotionEvent ) {
      yield PostingDevotion();

      try { 
        print('yes: ${event._title}, ${event._body}');
        String response = await devotionRepo.createDevotion(event._title, event._body);
        print('Bloc now $response');

        if (response != null)
           yield PostedDevotionState(response);

        // if(event is )
        // yield NotPostedYet();

      } catch (e) {
        print(e);
        yield FailedToPostDevotion();
      }
    } else {
      yield NotPostedYet();
    }
  }
}