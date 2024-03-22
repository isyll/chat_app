import 'package:chat_app/config/constants.dart';
import 'package:chat_app/screens/discussions.dart';
import 'package:chat_app/screens/loader.dart';
import 'package:chat_app/screens/login.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: const AuthScreenSwitcher(),
    );
  }
}

class AuthScreenSwitcher extends StatefulWidget {
  const AuthScreenSwitcher({super.key});

  @override
  State<AuthScreenSwitcher> createState() => _AuthScreenSwitcherState();
}

class _AuthScreenSwitcherState extends State<AuthScreenSwitcher> {
  bool _isLoggedIn = false;
  bool _isLoading = false;

  Future<void> checkIfUserLoggedIn() async {
    setState(() {
      _isLoggedIn = false;
      _isLoading = true;
    });
    final bool res = await AuthService.isUserAuthenticated();
    setState(() {
      _isLoggedIn = res;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    checkIfUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const LoaderScreen();
    } else if (_isLoggedIn) {
      return const DiscussionScreen();
    }

    return const LoginScreen();
  }
}
