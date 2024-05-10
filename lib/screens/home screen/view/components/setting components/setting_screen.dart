import 'package:flutter/cupertino.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_list_tile.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_switch.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/components/setting%20components/profile_edit_section.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PROFILE EDIT LIST TILE
        AdaptiveLisTile(
          title: 'Profile',
          subTitle: 'Update Profile Data',
          leading: const Icon(CupertinoIcons.person),
          trailing: AdaptiveSwitch(
            value: Provider.of<HomeProvider>(context, listen: true)
                .getShowProfileData(),
            method:
            Provider.of<HomeProvider>(context, listen: false)
                .toggleShowProfileData,
          ),
        ),

        // PROFILE EDIT SECTION
        const ProfileEditSection(),

        // THEME CHANGE LIST TILE
        AdaptiveLisTile(
          title: 'Theme',
          subTitle: 'Change Theme',
          leading: const Icon(CupertinoIcons.sun_max),
          trailing: AdaptiveSwitch(
            value: Provider.of<ThemeProvider>(context, listen: true)
                .getThemeMode(),
            method:
            Provider.of<ThemeProvider>(context, listen: false)
                .toggleThemePreference,
          ),
        ),
      ],
    );
  }
}

