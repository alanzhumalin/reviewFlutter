import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/logic/post_event.dart';
import 'package:posts/logic/post_state.dart';
import 'package:http/http.dart' as http;
import 'package:posts/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<LoadPost>(
      (event, emit) async {
        try {
          emit(PostLoading());

          final response = await http
              .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
          if (response.statusCode == 200) {
            final List<dynamic> jsonList = jsonDecode(response.body);
            final List<Post> posts =
                jsonList.map((json) => Post.fromJson(json)).toList();

            emit(PostLoaded(posts: posts));
          } else {
            emit(PostError(
                error: "Error occured while fetching the data from api"));
          }
        } catch (e) {
          emit(PostError(error: "Error occured + ${e.toString()}"));
        }
      },
    );
  }
}
