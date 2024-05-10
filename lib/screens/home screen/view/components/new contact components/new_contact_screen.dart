import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adpative_filled_button.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/components/new%20contact%20components/text_input_field_for_contact.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

import 'add_contact_photo.dart';

class NewContactTab extends StatelessWidget {
  const NewContactTab({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ADD CONTACT PHOTO
        AddContactPhoto(homeProviderTrue: homeProviderTrue),

        // TEXT INPUT FIELDS
        TextInputFieldsForContact(homeProviderTrue: homeProviderTrue),

        // DATE PICKER
        Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
            ? CupertinoListTile(
                onTap: () {
                  _selectDate(context);
                },
                title: const Text('Pick Date'),
                subtitle: const Text('dd-mm-yyyy'),
                leading: const Icon(CupertinoIcons.calendar),
                trailing: const Icon(CupertinoIcons.forward),
              )
            : ListTile(
                onTap: () {
                  _selectDateMaterialApp(context);
                },
                title: const Text('Pick Date'),
                subtitle: const Text('dd-mm-yyyy'),
                leading: const Icon(Icons.calendar_month_rounded),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),

        const SizedBox(
          height: defaultPadding,
        ),

        // TIMER PICKER
        Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
            ? CupertinoListTile(
                onTap: () {
                  _selectTime(context);
                },
                title: const Text('Pick Time'),
                subtitle: const Text('00:00'),
                leading: const Icon(CupertinoIcons.time),
                trailing: const Icon(CupertinoIcons.forward),
              )
            : ListTile(
                onTap: () {
                  _selectTimeMaterialApp(context);
                },
                title: const Text('Pick Time'),
                subtitle: const Text('00:00'),
                leading: const Icon(Icons.more_time_sharp),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              ),

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
    );
  }
}

// CUPERTINO SELECT TIME
Future<void> _selectTime(BuildContext context) async {
  TimeOfDay? pickedTime = await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 260,
        color: CupertinoTheme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1C1C1E)
            : Colors.white,
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          initialTimerDuration: Duration.zero,
          onTimerDurationChanged: (Duration newDuration) {},
        ),
      );
    },
  );
  if (pickedTime != null) {}
}

// CUPERTINO SELECT DATE
Future<void> _selectDate(BuildContext context) async {
  DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 260,
        color: CupertinoTheme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1C1C1E)
            : Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime(1997),
          onDateTimeChanged: (DateTime newDateTime) {},
        ),
      );
    },
  );
  if (pickedDate != null) {}
}

// MATERIAL DATE PICKER
Future<void> _selectDateMaterialApp(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime(1997),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null) {}
}

// MATERIAL Time PICKER
Future<void> _selectTimeMaterialApp(BuildContext context) async {
  TimeOfDay? pickedTime =
      await showTimePicker(context: context, initialTime: TimeOfDay.now());

  if (pickedTime != null) {}
}
