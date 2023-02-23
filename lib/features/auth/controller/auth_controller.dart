import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/apis/user_api.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/features/auth/screen/login_screen.dart';
import 'package:twitter_clone/features/home/screen/home_screen.dart';
import 'package:appwrite/models.dart' as models;
import 'package:twitter_clone/models/user_model.dart';
import 'package:twitter_clone/utils/utils.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  final authAPI = ref.watch(authAPIProvider);
  return AuthController(
    authAPI: authAPI,
    userAPI: ref.watch(userAPIProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) {
  final authController = ref.watch(authControllerProvider.notifier);

  return authController.currentUser();
});

class AuthController extends StateNotifier<bool> {
  final UserAPI _userAPI;
  final AuthAPI _authAPI;
  AuthController({
    required AuthAPI authAPI,
    required UserAPI userAPI,
  })  : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);

  // state = isLoading variable

  Future<models.Account?> currentUser() => _authAPI.currentUserAccount();

  void signUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authAPI.signUp(
      email: email,
      password: password,
    );
    state = false;
    response.fold(
      (l) => showSnackBar(content: l.message, context: context),
      (r) {
        Navigator.pushNamed(context, LoginScreen.routeName);
      },
    );
  }

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _authAPI.login(
      email: email,
      password: password,
    );
    state = false;
    response.fold(
      (l) => showSnackBar(content: l.message, context: context),
      (r) async {
        UserModel userModel = UserModel(
          email: email,
          name: getNameFromEmail(email),
          followers: const [],
          following: const [],
          profilePic: '',
          bannerPic: '',
          uid: '',
          bio: '',
          isTwitterBlue: false,
        );
        final result = await _userAPI.saveUserData(userModel);
        result.fold((l) => showSnackBar(content: l.message, context: context),
            (_) {
          Navigator.pushNamed(context, HomeScreen.routeName);
        });
      },
    );
  }
}
