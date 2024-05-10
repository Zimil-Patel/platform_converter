import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_switch.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/components/calls%20components/calls_screen.dart';
import 'package:platform_converter/screens/home%20screen/view/components/chats%20components/chats_screen.dart';
import 'package:platform_converter/screens/home%20screen/view/components/new%20contact%20components/new_contact_screen.dart';
import 'package:platform_converter/screens/home%20screen/view/components/setting%20components/setting_screen.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:provider/provider.dart';


class IosPlatformApp extends StatelessWidget {
  const IosPlatformApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProviderTrue =
        Provider.of<ThemeProvider>(context, listen: true);
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: true);
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: themeProviderTrue.getThemeMode()
            ? Brightness.dark
            : Brightness.light,
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('Platform Converter'),
          trailing: AdaptiveSwitch(
            value: homeProviderTrue.getPlatformMode(),
            method: homeProviderFalse.togglePlatformPreference,
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50),
          child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                onTap: (value) => homeProviderFalse.toggleTabIndex(value),
                currentIndex: homeProviderTrue.tabIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.person_add,
                    ),
                    label: 'NEW',
                    activeIcon: Icon(
                      CupertinoIcons.person_add_solid,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.chat_bubble_2,
                    ),
                    label: 'CHATS',
                    activeIcon: Icon(
                      CupertinoIcons.chat_bubble_2_fill,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.phone,
                    ),
                    label: 'CALLS',
                    activeIcon: Icon(
                      CupertinoIcons.phone_fill,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      CupertinoIcons.settings,
                    ),
                    label: 'SETTINGS',
                    activeIcon: Icon(
                      CupertinoIcons.settings_solid,
                    ),
                  ),
                ],
              ),
              tabBuilder: (context, index) {
                if (index == 0) {
                  // CONTACT ADD TAB
                  return const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: NewContactTab(),
                      ),
                    ],
                  );
                } else if (index == 1) {
                  // CHATS TAB
                  return const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: ChatsTab(),
                      ),
                    ],
                  );
                } else if (index == 2) {
                  // CALLS TAB
                  return const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: CallsTab(),
                      ),
                    ],
                  );
                } else {
                  // SETTING TAB
                  return const CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: SettingTab(),
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
