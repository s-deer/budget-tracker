import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../I18n/i18n.dart';
import '../../../routes/routes.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = context.t.home_page;

    return AutoTabsScaffold(
      routes: const [
        ErrorRoute(),
        ErrorRoute(),
        ErrorRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return NavigationBar(
          selectedIndex: tabsRouter.activeIndex,
          onDestinationSelected: tabsRouter.setActiveIndex,
          destinations: [
            NavigationDestination(
              icon: const Icon(Icons.credit_card),
              label: t.accounts,
            ),
            NavigationDestination(
              icon: const Icon(Icons.credit_card),
              label: t.categories,
            ),
            NavigationDestination(
              icon: const Icon(Icons.credit_card),
              label: t.transactions,
            ),
          ],
        );
      },
    );
  }
}
