import 'package:posts/user.dart';

sealed class ProfilesState {}

class ProfilesInitial extends ProfilesState {}

class ProfilesLoading extends ProfilesState {}

class ProfilesLoaded extends ProfilesState {
  final List<User> profiles;
  ProfilesLoaded({required this.profiles});
}

class ProfilesError extends ProfilesState {
  final String message;
  ProfilesError({required this.message});
}
