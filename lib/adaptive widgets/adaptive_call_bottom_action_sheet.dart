import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launch;

class AdaptiveCallBottomActionSheet extends StatelessWidget {
  const AdaptiveCallBottomActionSheet(
      {super.key,
      required this.name,
      required this.message,
      required this.number, required this.img});

  final String name, message, number;
  final File img;

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);
    final Uri url = Uri.parse('tel: $number');
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
                      padding:
                          EdgeInsets.symmetric(vertical: defaultPadding / 2),
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
                title: const Text('Call'),
                onTap: () {
                  launch.launchUrl(url);
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
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
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
                  'Call',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  launch.launchUrl(url);
                  Navigator.pop(context);
                },
              ),
            ],
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
          );
  }
}
