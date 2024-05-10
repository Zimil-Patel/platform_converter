import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_switch.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/components/setting_screen.dart';
import 'package:platform_converter/theme/theme_provider.dart';

import '../../../../theme/material_theme.dart';

class AndroidPlatformApp extends StatelessWidget {
  const AndroidPlatformApp({
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
    return MaterialApp(
      theme: MaterialTheme.lightTheme,
      darkTheme: MaterialTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode:
          themeProviderTrue.getThemeMode() ? ThemeMode.dark : ThemeMode.light,
      home: DefaultTabController(
        length: 4,
        initialIndex: homeProviderTrue.tabIndex,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: const Text('Platform Converter'),
            actions: [
              AdaptiveSwitch(
                value: homeProviderTrue.getPlatformMode(),
                method: (value) {
                  homeProviderFalse.togglePlatformPreference(value);
                },
              )
            ],

            bottom: TabBar(
              onTap: (value) => homeProviderFalse.toggleTabIndex(value),
              tabs: const [
                Tab(icon: Icon(Icons.person_add_alt_outlined), ),
                Tab(text: 'CHATS',),
                Tab(text: 'CALLS',),
                Tab(text: 'SETTINGS',),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(color: Colors.pinkAccent,),
              Container(color: Colors.purple,),
              Container(color: Colors.blueGrey,),

              // SETTING TAB
              SettingTab(themeProviderTrue: themeProviderTrue),
            ],
          ),
        ),
      ),
    );
  }
}
