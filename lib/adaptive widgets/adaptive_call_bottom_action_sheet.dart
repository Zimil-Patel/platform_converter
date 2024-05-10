import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

class AdaptiveCallBottomActionSheet extends StatelessWidget {
  const AdaptiveCallBottomActionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider provider =
    Provider.of<HomeProvider>(context, listen: true);

    return !provider.getPlatformMode()
        ? ListView(
      shrinkWrap: true,
      children: [
        const Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: CircleAvatar(
                  radius: 24,
                  child: FlutterLogo(),
                ),
              ),
              Text('Jash24', style: TextStyle(fontWeight: FontWeight.bold),),
              Text('You use a default timer for disappearing messages in new chats. New messages will dis...'),
            ],
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: defaultPadding * 3),
          leading: Icon(Icons.edit, size: height * 0.020,),
          title: const Text('Call'),
          onTap: () {
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
      title: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: CircleAvatar(
              radius: 24,
              child: FlutterLogo(),
            ),
          ),
          Text('Jash24'),
        ],
      ),
      message: const Text('You use a default timer for disappearing messages in new chats. New messages will dis...'),
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
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
