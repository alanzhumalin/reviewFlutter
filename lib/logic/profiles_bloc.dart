import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/logic/profiles_event.dart';
import 'package:posts/logic/profiles_state.dart';
import 'package:http/http.dart' as http;
import 'package:posts/user.dart';

class ProfilesBloc extends Bloc<ProfilesEvent, ProfilesState> {
  ProfilesBloc() : super(ProfilesInitial()) {
    on<LoadProfiles>(
      (event, emit) async {
        try {
          emit(ProfilesLoading());

          final response = await http
              .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

          if (response.statusCode == 200) {
            final List<dynamic> jsonList = jsonDecode(response.body);

            final List<User> profiles =
                jsonList.map((json) => User.fromJson(json)).toList();
            print("Loaded");
            emit(ProfilesLoaded(profiles: profiles));
          } else {
            emit(ProfilesError(
                message: "Error occured while loading profiles from api"));
          }
        } catch (e) {
          emit(ProfilesError(message: "Error occured ${e.toString()}"));
        }
      },
    );
  }
}
