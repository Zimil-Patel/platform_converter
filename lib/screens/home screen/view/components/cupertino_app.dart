import 'package:flutter/cupertino.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_switch.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../utils/constant.dart';


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
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              onTap: (value) => homeProviderFalse.toggleTabIndex(value),
              currentIndex: homeProviderTrue.tabIndex,
              items: <BottomNavigationBarItem>[
                ...tabItemList,
              ],
            ),
            tabBuilder: (context, index) {
              return CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: SingleChildScrollView(child: tabList[index]),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

