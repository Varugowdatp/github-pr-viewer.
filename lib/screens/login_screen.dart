import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/utils/theme_provider.dart';
import 'pull_request_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _login() async {
    final prefs = await SharedPreferences.getInstance();
    final token = _controller.text.isNotEmpty ? _controller.text : "abc123";
    await prefs.setString("token", token);

    // show CupertinoAlertDialog for success
    await showCupertinoDialog(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: const Text("Login Successful"),
        content: Text("Token saved: $token"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );

    // navigate to PR screen
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (_) => const PullRequestScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("Login"),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Quick toggle, helpful while testing
            themeProvider.toggle();
          },
          child: const Icon(CupertinoIcons.moon_stars),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome 👋",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              const Text("Enter any token (or leave blank for demo token)"),
              const SizedBox(height: 18),
              CupertinoTextField(
                controller: _controller,
                placeholder: "Enter token (or leave empty)",
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton.filled(
                      onPressed: _login,
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
