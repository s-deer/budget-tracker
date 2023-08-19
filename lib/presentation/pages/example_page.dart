import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../i18n/i18n.dart';

@RoutePage()
class ExamplePage extends StatelessWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(t.example.hello),
      ),
    );
  }
}
