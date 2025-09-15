import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/api/github_api.dart';
import '../core/models/pull_request_model.dart';
import '../widgets/pr_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../core/utils/theme_provider.dart';
import '../core/utils/constants.dart';

class PullRequestScreen extends StatefulWidget {
  const PullRequestScreen({super.key});

  @override
  State<PullRequestScreen> createState() => _PullRequestScreenState();
}

class _PullRequestScreenState extends State<PullRequestScreen> {
  late Future<List<PullRequest>> _future;

  @override
  void initState() {
    super.initState();
    _future = GitHubAPI.fetchPullRequests();
  }

  Future<void> _refresh() async {
    setState(() {
      _future = GitHubAPI.fetchPullRequests();
    });
  }

  Future<void> _showToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? 'No token saved';
    await showCupertinoDialog(
      context: context,
      builder:
          (ctx) => CupertinoAlertDialog(
            title: const Text("Stored Token"),
            content: Text(token),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text("Close"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text("GitHub PRs"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Token button
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _showToken,
              child: const Icon(CupertinoIcons.lock_circle),
            ),
            const SizedBox(width: 8),
            // Dark mode toggle
            CupertinoSwitch(
              value: isDark,
              onChanged: (_) => themeProvider.toggle(),
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: FutureBuilder<List<PullRequest>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            } else if (snapshot.hasError) {
              return CustomErrorWidget(onRetry: _refresh);
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No PRs found"));
            } else {
              final prs = snapshot.data!;
              return CupertinoScrollbar(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: prs.length,
                    itemBuilder: (context, index) => PRCard(pr: prs[index]),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
