import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../utils/constant.dart';
import 'adaptive_call_bottom_action_sheet.dart';

class AdaptiveCallListTile extends StatelessWidget {
  const AdaptiveCallListTile({
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
                  radius: 30,
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
                        builder: (context) =>
                            const AdaptiveCallBottomActionSheet(),
                      );
                    },

                    // TITLE - CHAT PERSON NAME
                    title: Text('Jash24', style: TextStyle(
                      fontSize: height * 0.020,
                    ),),

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
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('10:05'),
                        SizedBox(
                          width: defaultPadding / 2,
                        ),
                        Icon(
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
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: CircleAvatar(
                      radius: 30,
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
                          builder: (context) =>
                              const AdaptiveCallBottomActionSheet(),
                        );
                      },

                      // TITLE - PERSON NAME
                      title: Text(
                        'Jash24',
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
                            '10:05',
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
