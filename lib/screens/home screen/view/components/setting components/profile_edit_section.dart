import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import 'adaptive_profile_section.dart';

class ProfileEditSection extends StatelessWidget {
  const ProfileEditSection({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:
          Provider.of<HomeProvider>(context, listen: true).getShowProfileData(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Provider.of<HomeProvider>(context, listen: true)
              .getPlatformMode() ? CupertinoListSection.insetGrouped(
            backgroundColor:
                Provider.of<ThemeProvider>(context, listen: true).getThemeMode() ? Colors.black : Colors.white,
            children: const [
              AdaptiveProfileEditSection(),
            ],
          ) : const AdaptiveProfileEditSection(),
        ],
      ),
    );
  }
}