import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_date_picker.dart';
import 'package:platform_converter/adaptive%20widgets/adpative_filled_button.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/components/new%20contact%20components/text_input_field_for_contact.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

import '../../../../../adaptive widgets/adaptive_time_picker.dart';
import 'add_contact_photo.dart';

class NewContactTab extends StatelessWidget {
  const NewContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ADD CONTACT PHOTO
          AddContactPhoto(homeProviderTrue: homeProviderTrue),

          // TEXT INPUT FIELDS
          TextInputFieldsForContact(homeProviderTrue: homeProviderTrue),

          // DATE PICKER
          const AdaptiveDatePicker(),

          const SizedBox(
            height: defaultPadding,
          ),

          // TIMER PICKER
          const AdaptiveTimePicker(),

          const SizedBox(
            height: defaultPadding,
          ),

          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AdaptiveFilledButton(lable: 'Clear'),
              AdaptiveFilledButton(lable: 'Save'),
            ],
          ),
        ],
      ),
    );
  }
}
