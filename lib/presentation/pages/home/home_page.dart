import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'widgets/home_content.dart';

@RoutePage<void>()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: HomeContent(),
    );
  }
}
