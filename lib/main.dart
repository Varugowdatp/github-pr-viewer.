import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'core/utils/constants.dart';
import 'core/utils/theme_provider.dart';

void main() {
  runApp(const GitHubPRApp());
}

class GitHubPRApp extends StatelessWidget {
  const GitHubPRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme:
                theme.isDark
                    ? const CupertinoThemeData(
                      brightness: Brightness.dark,
                      primaryColor: AppColors.primary,
                      scaffoldBackgroundColor: AppColors.darkBackground,
                      textTheme: CupertinoTextThemeData(
                        textStyle: TextStyle(color: AppColors.textDark),
                      ),
                    )
                    : const CupertinoThemeData(
                      brightness: Brightness.light,
                      primaryColor: AppColors.primary,
                      scaffoldBackgroundColor: AppColors.background,
                      textTheme: CupertinoTextThemeData(
                        textStyle: TextStyle(color: AppColors.textLight),
                      ),
                    ),
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
