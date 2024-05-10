import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

class AdaptiveBottomActionSheetPhotoOptions extends StatelessWidget {
  const AdaptiveBottomActionSheetPhotoOptions({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);
    ContactProvider contactProviderFalse =
        Provider.of<ContactProvider>(context, listen: false);
    return !provider.getPlatformMode()
        ? ListView(
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Edit Picture',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Choose you option from below'),
                  ],
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * 3),
                leading: Icon(
                  Icons.camera_alt_rounded,
                  size: height * 0.020,
                ),
                title: const Text('Take Photo'),
                onTap: () {
                  contactProviderFalse.takePhoto();
                  Navigator.pop(context);
                },
              ),
              const Divider(
                height: 0,
                indent: 30,
                endIndent: 30,
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * 3),
                leading: Icon(
                  Icons.photo_size_select_actual_rounded,
                  size: height * 0.020,
                ),
                title: const Text('Choose Photo'),
                onTap: () {
                  contactProviderFalse.choosePhoto();
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel')),
                  ],
                ),
              ),
            ],
          )
        : CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            title: const Text('Edit Picture'),
            message: const Text('Choose you option from below'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                isDefaultAction: false,
                child: const Text(
                  'Take Photo',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  contactProviderFalse.takePhoto();
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                isDefaultAction: false,
                child: const Text(
                  'Choose Photo',
                ),
                onPressed: () {
                  contactProviderFalse.choosePhoto();
                  Navigator.pop(context);
                },
              ),
            ],
          );
  }
}
