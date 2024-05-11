import 'package:flutter/cupertino.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_call_list_tile.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/constant.dart';
import '../../../provider/contact_provider.dart';

class CallsTab extends StatelessWidget {
  const CallsTab({super.key});

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    return contactProviderTrue.contactList.isEmpty
        ?  Provider.of<HomeProvider>(context, listen: true).getPlatformMode() ? Container(
          alignment: Alignment.center,
          height: height,
          child: const Text('No Calls Yet...'),
        ) : Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 200),
      height: height,
      child: const Text('No Calls Yet...'),
    )
        : SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: defaultPadding,
                ),
                ...List.generate(
                  contactProviderTrue.contactList.length,
                  (index) => AdaptiveCallListTile(index: index),
                ),
              ],
            ),
          );
  }
}
