import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../core/models/pull_request_model.dart';
import '../core/utils/constants.dart';
import '../core/utils/theme_provider.dart';

class PRCard extends StatelessWidget {
  final PullRequest pr;
  const PRCard({super.key, required this.pr});

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.12),
            blurRadius: 6,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pr.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: isDark ? AppColors.textDark : AppColors.textLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            pr.body,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isDark ? AppColors.textDark.withOpacity(0.85) : null,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By: ${pr.author}",
                style: TextStyle(
                  color:
                      isDark
                          ? AppColors.muted.withOpacity(0.9)
                          : AppColors.muted,
                ),
              ),
              Text(
                pr.createdAt.split("T").first,
                style: TextStyle(
                  color:
                      isDark
                          ? AppColors.muted.withOpacity(0.9)
                          : AppColors.muted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
