import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/common/error_screen.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/screen/signup_screen.dart';
import 'package:twitter_clone/features/home/screen/home_screen.dart';
import 'package:twitter_clone/routes.dart';
import 'package:twitter_clone/utils/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Twitter Clone',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return const HomeScreen();
              }
              return const SignUpScreen();
            },
            error: (error, st) => ErrorScreen(
              error: error.toString(),
            ),
            loading: () => const LoadingScreen(),
          ),
    );
  }
}
