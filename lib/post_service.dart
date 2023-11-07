import 'package:flutter_bottom_aierke/userinf.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'post_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostApiClient {
  factory PostApiClient(Dio dio, {String baseUrl}) = _PostApiClient;

  @GET("/posts")
  Future<List<Post>> getPosts();
}
