import 'package:budget_tracker/core/failure.dart';
import 'package:budget_tracker/presentation/i18n/translations.g.dart';
import 'package:budget_tracker/presentation/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

extension SnackBarContextExtension on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showFailureSnackBar(Failure failure,
      {bool hidePreviousSnackBar = false}) {
    final messenger = ScaffoldMessenger.of(this);

    if (hidePreviousSnackBar) {
      messenger.hideCurrentSnackBar();
    }

    return messenger.showSnackBar(
      failureSnackBar(
        context: this,
        message: t.error_message.general,
      ),
    );
  }
}
