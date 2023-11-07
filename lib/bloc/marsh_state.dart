import 'package:flutter_bottom_aierke/userinf.dart';

abstract class MarshState {}

class InitialState extends MarshState {}

class LoadingState extends MarshState {}

class LoadedState extends MarshState {
  final List<Post> posts;
  LoadedState(this.posts);
}

class ErrorState extends MarshState {
  final String message;
  ErrorState(this.message);
}
