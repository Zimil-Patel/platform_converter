import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';

import '../../../../../adaptive widgets/adaptive_text_field_row.dart';

class TextInputFieldsForContact extends StatelessWidget {
  const TextInputFieldsForContact({
    super.key,
    required this.homeProviderTrue,
  });

  final HomeProvider homeProviderTrue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
      child: homeProviderTrue.getPlatformMode()
          ? CupertinoListSection(
        dividerMargin: 0,
        margin: EdgeInsets.zero,
        topMargin: 0,
        children: <AdaptiveTextFormFieldRow>[
          AdaptiveTextFormFieldRow(
            controller: TextEditingController(),
            hintText: 'Full Name',
          ),
          AdaptiveTextFormFieldRow(
            controller: TextEditingController(),
            hintText: 'Phone Number',
          ),
          AdaptiveTextFormFieldRow(
            controller: TextEditingController(),
            hintText: 'Chat Conversation',
          ),
        ],
      )
          : Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 1.5),
        child: Column(
          children: [
            AdaptiveTextFormFieldRow(
              controller: TextEditingController(),
              hintText: 'Full Name',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: defaultPadding),
            AdaptiveTextFormFieldRow(
              controller: TextEditingController(),
              hintText: 'Phone Number',
              prefixIcon: Icons.phone,
            ),
            const SizedBox(height: defaultPadding),
            AdaptiveTextFormFieldRow(
              controller: TextEditingController(),
              hintText: 'Chat Conversation',
              prefixIcon: Icons.message_sharp,
            ),
          ],
        ),
      ),
    );
  }
}


