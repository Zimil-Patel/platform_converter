import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_bottom_action_sheet_photo_option.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/provider/profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/constant.dart';

class AdaptiveProfilePhoto extends StatelessWidget {
  const AdaptiveProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider =
        Provider.of<HomeProvider>(context, listen: true);
    ProfileProvider profileProviderTrue =
        Provider.of<ProfileProvider>(context, listen: true);
    ProfileProvider profileProviderFalse =
        Provider.of<ProfileProvider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // PROFILE PHOTO EDIT
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    homeProvider.getPlatformMode()
                        ? showCupertinoModalPopup(
                            context: context,
                            builder: (context) =>
                                AdaptiveBottomActionSheetPhotoOptions(
                                    takePhoto: profileProviderFalse
                                        .takeProfilePicture,
                                    choosePhoto: profileProviderFalse
                                        .chooseProfilePicture),
                          )
                        : showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                AdaptiveBottomActionSheetPhotoOptions(
                                    takePhoto: profileProviderFalse
                                        .takeProfilePicture,
                                    choosePhoto: profileProviderFalse
                                        .chooseProfilePicture),
                          );
                  },
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            homeProvider.getPlatformMode() ? 0 : 4),
                        child: CircleAvatar(
                          radius: homeProvider.getPlatformMode() ? 30 : 46,
                          backgroundColor: Colors.blueAccent,
                          backgroundImage:
                              profileProviderTrue.profileImage != null
                                  ? FileImage(profileProviderTrue.profileImage!)
                                  : null,
                          child: profileProviderTrue.profileImage != null
                              ? null
                              : const Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      if (!homeProvider.getPlatformMode())
                        Positioned(
                          bottom: 0.001,
                          right: 0.001,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: homeProvider.getPlatformMode() ? 12 : 16,
                              backgroundColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                              child: const Icon(
                                Icons.edit,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            // DISPLAY HELP TEXT IF IT IS IOS PLATFORM
            if (homeProvider.getPlatformMode())
              const SizedBox(
                width: defaultPadding,
              ),
            // HELP TEXT
            homeProvider.getPlatformMode()
                ? Expanded(
                    child: Text(
                      'Enter your name and add an optional profile picture',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).dividerColor,
                          ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),

        // EDIT BUTTON IF IT IS IOS PLATFORM
        if (homeProvider.getPlatformMode())
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding / 2 + 1),
            child: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: Text(
                'Edit',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.blueAccent,
                    ),
              ),
            ),
          ),
      ],
    );
  }
}
