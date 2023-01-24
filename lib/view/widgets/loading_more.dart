import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoadingMore extends StatelessWidget {
  final bool isLoading;
  const LoadingMore({
    super.key,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            margin: const EdgeInsets.only(
              left: 10,
              right: 50,
            ),
            child: const CircularProgressIndicator(),
          )
        : const SizedBox();
  }
}
