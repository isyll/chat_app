import 'package:chat_app/config/constants.dart';
import 'package:chat_app/providers/theme_provider.dart';
import 'package:chat_app/screens/discussions_screen.dart';
import 'package:chat_app/screens/loader_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/storage_service.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.appName,
      theme: Provider.of<ThemeProvider>(context).darkMode
          ? AppTheme.darkTheme
          : AppTheme.lightTheme,
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
  bool? _darkMode;
  Brightness? _platformBrightness;

  Future<void> checkIfUserLoggedIn() async {
    setState(() {
      _isLoggedIn = false;
    });
    final bool res = await AuthService.isUserAuthenticated();
    setState(() {
      _isLoggedIn = res;
    });
  }

  Future<void> loadTheme() async {
    final isDarkMode = _platformBrightness == Brightness.dark;
    final provider = Provider.of<ThemeProvider>(context, listen: false);

    _darkMode = await StorageService.getDarkMode(isDarkMode);
    provider.darkMode = _darkMode!;
  }

  @override
  void initState() {
    super.initState();

    Future.wait([checkIfUserLoggedIn(), loadTheme()])
        .then((value) => setState(() {
              _isLoading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    _platformBrightness = MediaQuery.of(context).platformBrightness;

    setState(() {
      _isLoading = true;
    });

    Future.wait([checkIfUserLoggedIn(), loadTheme()])
        .then((value) => setState(() {
              _isLoading = false;
            }));

    setState(() {
      _isLoading = false;
    });
    if (_isLoading) {
      return const LoaderScreen();
    } else if (_isLoggedIn) {
      return const DiscussionScreen();
    }

    return const LoginScreen();
  }
}
