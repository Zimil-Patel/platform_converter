import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/home screen/provider/contact_provider.dart';
import '../screens/home screen/provider/home_provider.dart';

class AdaptiveDatePicker extends StatelessWidget {
  const AdaptiveDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    ContactProvider contactProviderFalse =
        Provider.of<ContactProvider>(context, listen: false);
    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
        ? CupertinoListTile(
            onTap: () {
              _selectDate(context, contactProviderFalse);
            },
            title: const Text('Pick Date'),
            subtitle: Text(contactProviderTrue.screenModel.selectedDate != null
                ? '${contactProviderTrue.screenModel.selectedDate!.day}/${contactProviderTrue.screenModel.selectedDate!.month}/${contactProviderTrue.screenModel.selectedDate!.year}'
                : 'dd-mm-yyyy'),
            leading: const Icon(CupertinoIcons.calendar),
            trailing: const Icon(CupertinoIcons.forward),
          )
        : ListTile(
            onTap: () async {
              contactProviderFalse
                  .setSelectedDate(await _selectDateMaterialApp(context));
            },
            title: const Text('Pick Date'),
            subtitle: Text(contactProviderTrue.screenModel.selectedDate != null
                ? '${contactProviderTrue.screenModel.selectedDate!.day}/${contactProviderTrue.screenModel.selectedDate!.month}/${contactProviderTrue.screenModel.selectedDate!.year}'
                : 'dd-mm-yyyy'),
            leading: const Icon(Icons.calendar_month_rounded),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          );
  }
}

// CUPERTINO SELECT DATE
Future<DateTime?> _selectDate(
    BuildContext context, ContactProvider providerFalse) async {
  return await showCupertinoModalPopup<DateTime>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 260,
        color: CupertinoTheme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1C1C1E)
            : Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: DateTime.now(),
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime newDateTime) {
            providerFalse.setSelectedDate(newDateTime);
          },
        ),
      );
    },
  );
}

// MATERIAL DATE PICKER
Future<DateTime?> _selectDateMaterialApp(BuildContext context) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
}
