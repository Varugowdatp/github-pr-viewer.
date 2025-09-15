import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;
  const CustomErrorWidget({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Failed to load data"),
          const SizedBox(height: 12),
          CupertinoButton.filled(
            onPressed: onRetry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
