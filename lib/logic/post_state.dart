import 'package:posts/post.dart';

sealed class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded({required this.posts});
}

class PostError extends PostState {
  final String error;
  PostError({required this.error});
}
