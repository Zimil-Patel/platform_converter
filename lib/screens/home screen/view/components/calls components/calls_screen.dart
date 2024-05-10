import 'package:flutter/cupertino.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_call_list_tile.dart';

import '../../../../../utils/constant.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: defaultPadding,
        ),
        AdaptiveCallListTile(),
        AdaptiveCallListTile(),
        AdaptiveCallListTile(),
      ],
    );
  }
}
