import 'package:flutter/material.dart';

SnackBar failureSnackBar({
  required BuildContext context,
  required String message,
}) {
  final theme = Theme.of(context);

  return SnackBar(
    backgroundColor: theme.colorScheme.errorContainer,
    content: Text(
      message,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onErrorContainer,
      ),
    ),
  );
}
