import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_switch.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/components/calls%20components/calls_screen.dart';
import 'package:platform_converter/screens/home%20screen/view/components/chats%20components/chats_screen.dart';
import 'package:platform_converter/screens/home%20screen/view/components/new%20contact%20components/new_contact_screen.dart';
import 'package:platform_converter/screens/home%20screen/view/components/setting%20components/setting_screen.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../../../theme/material_theme.dart';

class AndroidPlatformApp extends StatelessWidget {
  const AndroidPlatformApp({
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
                Tab(
                  icon: Icon(Icons.person_add_alt_outlined),
                ),
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'CALLS',
                ),
                Tab(
                  text: 'SETTINGS',
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              // NEW CONTACT TAB
              SingleChildScrollView(
                child: NewContactTab(),
              ),
              // CHATS TAB
              SingleChildScrollView(
                child: ChatsTab(),
              ),
              //CALLS TAB
              SingleChildScrollView(
                child: CallsTab(),
              ),
              // SETTING TAB
              SingleChildScrollView(
                child: SettingTab(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
