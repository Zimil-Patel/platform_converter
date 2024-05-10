import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/constant.dart';

class AdaptiveProfilePhoto extends StatelessWidget {
  const AdaptiveProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            Provider.of<HomeProvider>(context, listen: true)
                                    .getPlatformMode()
                                ? 0
                                : 4),
                        child: CircleAvatar(
                          radius: Provider.of<HomeProvider>(context, listen: true)
                              .getPlatformMode() ? 30 : 46,
                          backgroundColor: Colors.blueAccent,
                          child: const Icon(
                            CupertinoIcons.camera,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      if (!Provider.of<HomeProvider>(context, listen: true)
                          .getPlatformMode())
                        Positioned(
                          bottom: 0.001,
                          right: 0.001,
                          child: CircleAvatar(
                            radius: Provider.of<HomeProvider>(context, listen: true)
                                .getPlatformMode() ? 12 : 16,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            child: const Icon(
                              Icons.edit,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

            // DISPLAY HELP TEXT IF IT IS IOS PLATFORM
            if (Provider.of<HomeProvider>(context, listen: true)
                .getPlatformMode())
              const SizedBox(
                width: defaultPadding,
              ),
            // HELP TEXT
            Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
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
        if (Provider.of<HomeProvider>(context, listen: true).getPlatformMode())
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
