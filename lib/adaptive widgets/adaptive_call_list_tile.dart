import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../screens/home screen/provider/contact_provider.dart';
import '../utils/constant.dart';
import 'adaptive_call_bottom_action_sheet.dart';

class AdaptiveCallListTile extends StatelessWidget {
  const AdaptiveCallListTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    String name = contactProviderTrue.contactList[index].name;
    String number = contactProviderTrue.contactList[index].number;
    String message = contactProviderTrue.contactList[index].message;
    String time =
        '${(contactProviderTrue.contactList[index].timeOfDay.hour % 12).toString().padLeft(2, '0')}:${contactProviderTrue.contactList[index].timeOfDay.minute.toString().padLeft(2, '0')}';
    File image = contactProviderTrue.contactList[index].contactImg;
    return !provider.getPlatformMode()
        ? Row(
            children: [
              // CONTACT PHOTO
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  backgroundImage: FileImage(image),
                ),
              ),

              // CHAT LIST TILE DETAILS
              Expanded(
                child: SizedBox(
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => AdaptiveCallBottomActionSheet(
                          name: name,
                          message: message,
                          number: number,
                          img: image,
                        ),
                      );
                    },

                    // TITLE - CHAT PERSON NAME
                    title: Text(
                      name,
                      style: TextStyle(
                        fontSize: height * 0.020,
                      ),
                    ),

                    // SUBTITLE
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.phone_callback_rounded,
                          size: height * 0.015,
                        ),
                        const SizedBox(
                          width: defaultPadding / 2,
                        ),
                        const Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Incoming'),
                      ],
                    ),

                    // DATE AND TIME
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(time),
                        const SizedBox(
                          width: defaultPadding / 2,
                        ),
                        const Icon(
                          Icons.call,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Row(
                children: [
                  // CONTACT PHOTO
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      backgroundImage: FileImage(image),
                    ),
                  ),

                  // CHAR LIST TILE DETAILS
                  Expanded(
                    child: CupertinoListTile(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => AdaptiveCallBottomActionSheet(
                            name: name,
                            message: message,
                            number: number,
                            img: image,
                          ),
                        );
                      },

                      // TITLE - PERSON NAME
                      title: Text(
                        name,
                        style: TextStyle(
                          fontSize: height * 0.020,
                        ),
                      ),

                      // SUBTITLE
                      subtitle: Row(
                        children: [
                          Icon(
                            CupertinoIcons.phone_fill_arrow_down_left,
                            color: Colors.grey.withOpacity(0.7),
                            size: height * 0.015,
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            'Incoming',
                            style: TextStyle(
                              fontSize: height * 0.016,
                            ),
                          ),
                        ],
                      ),

                      // DATE AND TIME
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            time,
                            style: TextStyle(fontSize: height * 0.014),
                          ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          const Icon(CupertinoIcons.info),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.2,
                indent: 80,
              ),
            ],
          );
  }
}
