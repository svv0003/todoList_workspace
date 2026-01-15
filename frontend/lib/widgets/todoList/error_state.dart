import 'package:flutter/material.dart';
import 'package:frontend/widgets/todoList/empty_state.dart';

import '../../common/app_styles.dart';

class ErrorState extends StatelessWidget {
  /*
  Flutter는 변수 선언 시 생성자 또한 만들어서 필수로 받아야 하는 변수나 기능인지
  또는 선택적으로 받아도 되는 변수나 기능인지 생성자에 반드시 작성한다.
   */
  final String message;
  final VoidCallback onRetry;

  const ErrorState({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: 16),
            Text(
              // provider.errorMessage!,
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.error),
            ),
            const SizedBox(height: 24),
            FilledButton(
              // onPressed: () => provider.loadTodos(),
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      );;
  }
}