// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import 'package:twitter_clone/core/core.dart';

final authAPIProvider = Provider((ref) {
  return AuthAPI(
    account: ref.watch(appwriteAccountProvider),
  );
});

abstract class IAuthAPI {
  FutureEither<model.Account> signUp({
    required String email,
    required String password,
  });
  FutureEither<model.Session> login({
    required String email,
    required String password,
  });

  Future<model.Account?> currentUserAccount();
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({
    required Account account,
  }) : _account = account;

  @override
  Future<model.Account?> currentUserAccount() async {
    try {
      return await _account.get();
    } on AppwriteException catch (_) {
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  FutureEither<model.Account> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      return left(
        Failure(e.toString(), stackTrace),
      );
    }
  }

  @override
  FutureEither<model.Session> login({
    required String email,
    required String password,
  }) async {
    try {
      final session = await _account.createEmailSession(
        email: email,
        password: password,
      );
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(
        e.message ?? 'Some unexpected error occurred',
        stackTrace,
      ));
    } catch (e, stackTrace) {
      return left(Failure(
        e.toString(),
        stackTrace,
      ));
    }
  }
}
