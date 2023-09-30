import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/error_content.dart';

@RoutePage<void>()
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ErrorContent(),
    );
  }
}
