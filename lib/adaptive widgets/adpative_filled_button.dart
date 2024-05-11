import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/model/contact_model.dart';
import 'package:platform_converter/screens/home%20screen/model/screen_model.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:provider/provider.dart';

import '../screens/home screen/provider/home_provider.dart';

class AdaptiveFilledButton extends StatelessWidget {
  const AdaptiveFilledButton({super.key, required this.lable});

  final String lable;

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProviderFalse =
        Provider.of<ContactProvider>(context, listen: false);
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
        ? SizedBox(
            height: 40,
            child: CupertinoButton.filled(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(lable),
              onPressed: () {
                if (lable == 'Clear') {
                  contactProviderFalse.clearData(contactProviderTrue);
                } else {
                  ScreenModel screenModel = contactProviderTrue.screenModel;
                  if (isAllDataFilled(screenModel: screenModel)) {
                    ContactModel contactModel = ContactModel(
                      name: screenModel.txtName!.text,
                      message: screenModel.txtMessage!.text,
                      number: screenModel.txtNumber!.text,
                      contactImg: screenModel.image!,
                      dateTime: screenModel.selectedDate!,
                      timeOfDay: screenModel.selectedTime!,
                    );
                    contactProviderFalse.addContact(contactModel);
                    contactProviderFalse.clearData(contactProviderTrue);
                  } else {
                    log('Warning: Please Fill All Detail!');
                  }
                }
              },
            ),
          )
        : ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
            ),
            onPressed: () {
              if (lable == 'Clear') {
                contactProviderFalse.clearData(contactProviderTrue);

              } else {
                ScreenModel screenModel = contactProviderTrue.screenModel;
                if (isAllDataFilled(screenModel: screenModel)) {
                  ContactModel contactModel = ContactModel(
                    name: screenModel.txtName!.text,
                    message: screenModel.txtMessage!.text,
                    number: screenModel.txtNumber!.text,
                    contactImg: screenModel.image!,
                    dateTime: screenModel.selectedDate!,
                    timeOfDay: screenModel.selectedTime!,
                  );
                  contactProviderFalse.addContact(contactModel);
                  contactProviderFalse.clearData(contactProviderTrue);

                } else {
                  log('Warning: Please Fill All Detail!');
                }
              }
            },
            child: Text(lable));
  }

}

bool isAllDataFilled({required ScreenModel screenModel}) {
  if ((screenModel.txtName!.text.isNotEmpty && screenModel.txtName!.text != '') &&
      (screenModel.txtMessage!.text.isNotEmpty && screenModel.txtMessage!.text != '') &&
      (screenModel.txtNumber!.text.isNotEmpty && screenModel.txtNumber!.text != '') &&
      (screenModel.selectedDate != null) &&
      (screenModel.selectedTime != null) &&
      (screenModel.image != null)
  )
  {
    return true;
  } else {
    return false;
  }
}
