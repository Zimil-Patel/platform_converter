import 'package:flutter/cupertino.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_chat_list_tile.dart';
import 'package:platform_converter/utils/constant.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: defaultPadding,
        ),
        AdaptiveChatListTile(),
        AdaptiveChatListTile(),
        AdaptiveChatListTile(),
      ],
    );
  }
}
