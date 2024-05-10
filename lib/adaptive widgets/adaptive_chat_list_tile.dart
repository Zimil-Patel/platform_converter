import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../utils/constant.dart';
import 'adaptive_bottom_action_sheet.dart';

class AdaptiveChatListTile extends StatelessWidget {
  const AdaptiveChatListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context, listen: true);

    return !provider.getPlatformMode()
        ? Row(
            children: [
              // CONTACT PHOTO
              const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: CircleAvatar(
                  radius: 24,
                  // backgroundColor: primaryGreen.withOpacity(0.2),
                  child: FlutterLogo(),
                ),
              ),

              // CHAT LIST TILE DETAILS
              Expanded(
                child: SizedBox(
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const AdaptiveBottomActionSheet(),
                      );
                    },

                    // TITLE - CHAT PERSON NAME
                    title: const Text('Jash24'),

                    // SUBTITLE - CHAT MESSAGE
                    subtitle: const Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'You use a default timer for disappearing messages in new chats. New messages will dis...'),

                    // DATE AND TIME
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '19/02/23',
                          style: TextStyle(
                            fontSize: height * 0.016,
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
                              '00:00',
                              style: TextStyle(
                                fontSize: height * 0.016,
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
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: CircleAvatar(
                      radius: 24,
                      // backgroundColor: primaryGreen.withOpacity(0.2),
                      child: FlutterLogo(),
                    ),
                  ),

                  // CHAR LIST TILE DETAILS
                  Expanded(
                    child: CupertinoListTile(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => const AdaptiveBottomActionSheet(),
                        );
                      },

                      // TITLE - PERSON NAME
                      title: const Text('Jash24'),

                      // SUBTITLE - CHAT MESSAGE
                      subtitle: const Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          'You use a default timer for disappearing messages in new chats. New messages will dis...'),

                      // DATE AND TIME
                      trailing: Padding(
                        padding: const EdgeInsets.only(left: defaultPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '19/02/23',
                              style: TextStyle(
                                fontSize: height * 0.016,
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
                                  '00:00',
                                  style: TextStyle(
                                    fontSize: height * 0.016,
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
