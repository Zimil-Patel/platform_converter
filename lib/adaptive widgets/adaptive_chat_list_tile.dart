import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../utils/constant.dart';
import 'adaptive_bottom_action_sheet.dart';

class AdaptiveChatListTile extends StatelessWidget {
  const AdaptiveChatListTile({
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
    String date =
        '${contactProviderTrue.contactList[index].dateTime.day.toString().padLeft(2, '0')}/${contactProviderTrue.contactList[index].dateTime.month..toString().padLeft(2, '0')}/${contactProviderTrue.contactList[index].dateTime.year}';
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
                        builder: (context) => AdaptiveBottomActionSheet(
                          dateTime: contactProviderTrue.contactList[index].dateTime,
                          timeOfDay: contactProviderTrue.contactList[index].timeOfDay,
                          number: number,
                          name: name,
                          message: message,
                          img: image,
                          index: index,
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

                    // SUBTITLE - CHAT MESSAGE
                    subtitle: Text(
                        maxLines: 1, overflow: TextOverflow.ellipsis, message),

                    // DATE AND TIME
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                            fontSize: height * 0.015,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Transform.rotate(
                              angle: 120,
                              child: Icon(
                                size: height * 0.021,
                                CupertinoIcons.pin_fill,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: height * 0.015,
                              ),
                            ),
                          ],
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
                          builder: (context) => AdaptiveBottomActionSheet(
                            dateTime: contactProviderTrue.contactList[index].dateTime,
                            timeOfDay: contactProviderTrue.contactList[index].timeOfDay,
                            number: number,
                            name: name,
                            message: message,
                            img: image,
                            index: index,
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

                      // SUBTITLE - CHAT MESSAGE
                      subtitle: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        message,
                        style: TextStyle(
                          fontSize: height * 0.016,
                        ),
                      ),

                      // DATE AND TIME
                      trailing: Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              date,
                              style: TextStyle(
                                fontSize: height * 0.015,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.rotate(
                                  angle: 120,
                                  child: Icon(
                                    size: height * 0.020,
                                    CupertinoIcons.pin_fill,
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  time,
                                  style: TextStyle(
                                    fontSize: height * 0.015,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
