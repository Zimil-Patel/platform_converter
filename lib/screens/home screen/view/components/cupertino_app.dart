import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_switch.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/components/setting_screen.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../adaptive widgets/adaptive_list_tile.dart';
import '../../../../utils/constant.dart';

class IosPlatformApp extends StatelessWidget {
  const IosPlatformApp({
    super.key,
    required this.themeProviderTrue,
    required this.homeProviderTrue,
    required this.homeProviderFalse,
    required this.themeProviderFalse,
  });

  final ThemeProvider themeProviderTrue;
  final ThemeProvider themeProviderFalse;
  final HomeProvider homeProviderTrue;
  final HomeProvider homeProviderFalse;

  @override
  Widget build(BuildContext context) {
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
                  homeProviderFalse.toggleTabIndex(index);
                if(index == 0){
                  // CONTACT ADD TAB
                  return Container(color: Colors.pinkAccent,);
                } else if(index == 1){
                  // CHATS TAB
                  return Container(color: Colors.purple,);
                } else if(index == 2){
                  // CALLS TAB
                  return Container(color: Colors.blueGrey,);
                } else {
                  // SETTING TAB
                  return SettingTab(themeProviderTrue: themeProviderTrue,);
                }

              }),
        ),
      ),
    );
  }
}
