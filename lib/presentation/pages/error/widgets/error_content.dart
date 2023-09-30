import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/presentation/gen/assets.gen.dart';
import 'package:budget_tracker/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '.../../../../../I18n/i18n.dart';

class ErrorContent extends StatelessWidget {
  const ErrorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = context.t.error_page;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.svg.ufo.svg(),
                    const Gap(30),
                    Text(
                      t.title,
                      style: context.theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      t.message,
                      style: context.theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (context.router.canPop())
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: context.popRoute,
                    child: Text(t.go_back),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
