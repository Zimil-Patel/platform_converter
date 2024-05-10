import 'package:flutter/cupertino.dart';

import '../screens/home screen/view/components/calls components/calls_screen.dart';
import '../screens/home screen/view/components/chats components/chats_screen.dart';
import '../screens/home screen/view/components/new contact components/new_contact_screen.dart';
import '../screens/home screen/view/components/setting components/setting_screen.dart';

const double defaultPadding = 14.0;
late double height, width;

List<Widget> tabList = const [
  NewContactTab(),
  ChatsTab(),
  CallsTab(),
  SettingTab(),
];

List<BottomNavigationBarItem> tabItemList = const [
  BottomNavigationBarItem(
    icon: Icon(CupertinoIcons.person_add),
    label: 'NEW',
    activeIcon: Icon(CupertinoIcons.person_add_solid),
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
];
