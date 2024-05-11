import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_chat_list_tile.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

import '../../../provider/home_provider.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    return contactProviderTrue.contactList.isEmpty
        ? Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
            ? Container(
                alignment: Alignment.center,
                height: height,
                child: const Text('No Chats Yet...'),
              )
            : Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 200),
                height: height,
                child: const Text('No Chats Yet...'),
              )
        : SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: defaultPadding,
                ),
                ...List.generate(
                  contactProviderTrue.contactList.length,
                  (index) => AdaptiveChatListTile(index: index),
                ),
              ],
            ),
          );
  }
}
