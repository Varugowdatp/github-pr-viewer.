import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.all(12),
            child: Shimmer.fromColors(
              baseColor: CupertinoColors.systemGrey5,
              highlightColor: CupertinoColors.systemGrey3,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
    );
  }
}
