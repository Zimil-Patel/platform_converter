import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../screens/home screen/provider/contact_provider.dart';

class AdaptiveTimePicker extends StatelessWidget {
  const AdaptiveTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    ContactProvider contactProviderFalse =
        Provider.of<ContactProvider>(context, listen: false);
    return

        // TIMER PICKER
        Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
            ? CupertinoListTile(
                onTap: () {
                  _selectTime(context, contactProviderFalse);
                },
                title: const Text('Pick Time'),
                subtitle: Text(contactProviderTrue.screenModel.selectedTime !=
                        null
                    ? '${(contactProviderTrue.screenModel.selectedTime!.hour % 12).toString().padLeft(2, '0')}:${contactProviderTrue.screenModel.selectedTime!.minute.toString().padLeft(2, '0')}:${contactProviderTrue.screenModel.selectedTime!.period.name}'
                    : '00:00'),
                leading: const Icon(CupertinoIcons.time),
                trailing: const Icon(CupertinoIcons.forward),
              )
            : ListTile(
                onTap: () async {
                  contactProviderFalse
                      .setSelectedTime(await _selectTimeMaterialApp(context));
                },
                title: const Text('Pick Time'),
                subtitle: Text(contactProviderTrue.screenModel.selectedTime !=
                        null
                    ? '${(contactProviderTrue.screenModel.selectedTime!.hour % 12).toString().padLeft(2, '0')}:${contactProviderTrue.screenModel.selectedTime!.minute.toString().padLeft(2, '0')}:${contactProviderTrue.screenModel.selectedTime!.period.name}'
                    : '00:00'),
                leading: const Icon(Icons.more_time_sharp),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
              );
  }
}

// CUPERTINO SELECT TIME
Future<TimeOfDay?> _selectTime(
    BuildContext context, ContactProvider providerFalse) async {
  return await showCupertinoModalPopup(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 260,
        color: CupertinoTheme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1C1C1E)
            : Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.time,
          initialDateTime: DateTime(1997),
          onDateTimeChanged: (DateTime newDateTime) {
            providerFalse.setSelectedTime(
                TimeOfDay(hour: newDateTime.hour, minute: newDateTime.minute));
          },
        ),
      );
    },
  );
}

// MATERIAL Time PICKER
Future<TimeOfDay?> _selectTimeMaterialApp(BuildContext context) async {
  return await showTimePicker(context: context, initialTime: TimeOfDay.now());
}
