import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

import '../screens/home screen/model/screen_model.dart';
import 'adaptive_edit_dialog.dart';

class AdaptiveBottomActionSheet extends StatelessWidget {
  const AdaptiveBottomActionSheet(
      {super.key,
      required this.name,
      required this.message,
      required this.index,
      required this.img,
      required this.number,
      required this.dateTime,
      required this.timeOfDay});

  final String name, message, number;
  final int index;
  final File img;
  final DateTime dateTime;
  final TimeOfDay timeOfDay;

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    return !provider.getPlatformMode()
        ? ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: FileImage(img),
                      ),
                    ),
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(message),
                  ],
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: defaultPadding * 3),
                leading: Icon(
                  Icons.edit,
                  size: height * 0.020,
                ),
                title: const Text('Edit'),
                onTap: () async {
                  ScreenModel model = ScreenModel(
                    txtName: TextEditingController(text: name),
                    txtNumber: TextEditingController(text: number),
                    txtMessage: TextEditingController(text: message),
                    image: img,
                    selectedDate:
                        contactProviderTrue.contactList[index].dateTime,
                    selectedTime:
                        contactProviderTrue.contactList[index].timeOfDay,
                  );
                  Provider.of<ContactProvider>(context, listen: false)
                      .setEditScreenModel(model);
                  await showDialog(
                    context: context,
                    builder: (context) => CustomEditDialog(
                      index: index,
                    ),
                  );
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
                  Icons.delete,
                  size: height * 0.020,
                ),
                title: const Text('Delete'),
                onTap: () async {
                  await buildShowDialog(context, contactProviderTrue, index);
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
            title: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: FileImage(img),
                  ),
                ),
                Text(name),
              ],
            ),
            message: Text(message),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                isDefaultAction: true,
                child: const Text(
                  'Edit',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () async {
                  ScreenModel model = ScreenModel(
                    txtName: TextEditingController(text: name),
                    txtNumber: TextEditingController(text: number),
                    txtMessage: TextEditingController(text: message),
                    image: img,
                    selectedDate:
                        contactProviderTrue.contactList[index].dateTime,
                    selectedTime:
                        contactProviderTrue.contactList[index].timeOfDay,
                  );
                  Provider.of<ContactProvider>(context, listen: false)
                      .setEditScreenModel(model);
                  await showCupertinoDialog(
                    context: context,
                    builder: (context) => CustomEditDialog(
                      index: index,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                child: const Text(
                  'Delete',
                ),
                onPressed: () async {
                  await buildShowCupertinoDialog(
                      context, contactProviderTrue, index);
                  Navigator.pop(context);
                },
              ),
            ],
          );
  }
}

Future<dynamic> buildShowCupertinoDialog(
    BuildContext context, ContactProvider contactProviderTrue, int index) {
  return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Alert'),
          content: const Text('Are you sure ypu want to delete'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                contactProviderTrue.deleteContact(index);
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}

Future<dynamic> buildShowDialog(
    BuildContext context, ContactProvider contactProviderTrue, int index) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Alert'),
        content: const Text('Are you sure you want to delete?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
            ),
          ),
          TextButton(
            onPressed: () {
              contactProviderTrue.deleteContact(index);
              Navigator.pop(context);
            },
            child: Text(
              'OK',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      );
    },
  );
}
