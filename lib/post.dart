import 'package:dio/dio.dart';
import 'package:flutter_bottom_aierke/post_service.dart';
import 'package:flutter_bottom_aierke/userinf.dart';

class PostService {
  static final dio = Dio();
  static final client = PostApiClient(dio);

  static Future<List<Post>> fetchPosts() async {
    try {
      return await client.getPosts();
    } catch (e) {
      throw Exception('Failed to load posts');
    }
  }
}
