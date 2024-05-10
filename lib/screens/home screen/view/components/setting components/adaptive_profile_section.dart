import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_text_field.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

import 'adaptive_profile_photo.dart';

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
          // PROFILE PHOTO SECTION
          const AdaptiveProfilePhoto(),

          // NAME TEXT FIELD
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: Text(
              'NAME',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          AdaptiveTextField(
            controller: TextEditingController(),
            hintText: 'Enter you name',
          ),

          // BIO TEXT FIELD
          const SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: Text(
              'BIO',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          AdaptiveTextField(
            controller: TextEditingController(),
            hintText: 'Enter you bio',
            textColor: Colors.grey,
          ),

          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                  onPressed: () {},
                  child: Text(
                    'CLEAR',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color:
                              Provider.of<HomeProvider>(context, listen: true)
                                      .getPlatformMode()
                                  ? Colors.blueAccent
                                  : Theme.of(context).colorScheme.primary,
                        ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
