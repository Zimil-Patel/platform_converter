import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

class ProfileEditSection extends StatelessWidget {
  const ProfileEditSection({
    super.key,
    required this.themeProviderTrue,
  });

  final ThemeProvider themeProviderTrue;

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
                themeProviderTrue.getThemeMode() ? Colors.black : Colors.white,
            children: const [
              AdaptiveProfileEditSection(),
            ],
          ) : const AdaptiveProfileEditSection(),
        ],
      ),
    );
  }
}

class AdaptiveProfileEditSection extends StatelessWidget {
  const AdaptiveProfileEditSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
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
                          child: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blueAccent,
                            child: Icon(
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
                              radius: 12,
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

              if (Provider.of<HomeProvider>(context, listen: true)
                  .getPlatformMode())const SizedBox(
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
          if (Provider.of<HomeProvider>(context, listen: true)
              .getPlatformMode()) Padding(
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

          // NAME TEXT FIELD
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding * 2),
            child: Text(
              'NAME',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          CupertinoTextFormFieldRow(
            initialValue: 'Your Name',
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Colors.grey.withOpacity(0.4), width: 0.5))),
          ),

          // BIO TEXT FIELD
          const SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding * 2),
            child: Text(
              'BIO',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          CupertinoTextFormFieldRow(
            initialValue: 'Your Bio',
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Colors.grey.withOpacity(0.4), width: 0.5))),
          ),
        ],
      ),
    );
  }
}
