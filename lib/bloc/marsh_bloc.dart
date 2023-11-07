import 'dart:async';
import 'package:flutter_bottom_aierke/post.dart';
import 'package:flutter_bottom_aierke/userinf.dart';

import 'marsh_event.dart';
import 'marsh_state.dart';

class MarshBloc {
  final _stateController = StreamController<MarshState>.broadcast();
  final _eventController = StreamController<MarshEvent>.broadcast();

  Stream<MarshState> get stateStream => _stateController.stream;
  Sink<MarshEvent> get eventSink => _eventController.sink;

  MarshBloc() {
    _eventController.stream.listen(_eventHandler);
  }

  void _eventHandler(MarshEvent event) async {
    if (event is FetchPostsEvent) {
      _stateController.sink.add(LoadingState());
      try {
        List<Post> posts = await PostService.fetchPosts();
        _stateController.sink.add(LoadedState(posts));
      } catch (e) {
        _stateController.sink.add(ErrorState(e.toString()));
      }
    }
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
