import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_bottom_action_sheet_photo_option.dart';
import 'package:platform_converter/adaptive%20widgets/adpative_filled_button.dart';
import 'package:platform_converter/screens/home%20screen/model/screen_model.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

import '../screens/home screen/model/contact_model.dart';
import '../utils/constant.dart';
import 'adaptive_outlined_text_field.dart';

class CustomEditDialog extends StatelessWidget {
  const CustomEditDialog({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProviderTrue =
        Provider.of<ContactProvider>(context, listen: true);
    ContactProvider contactProviderFalse =
        Provider.of<ContactProvider>(context, listen: false);

    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
        ? CupertinoAlertDialog(
            title: const Text("Edit Contact"),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CupertinoButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) =>
                          AdaptiveBottomActionSheetPhotoOptions(
                              takePhoto: contactProviderFalse.editTakePhoto,
                              choosePhoto:
                                  contactProviderFalse.editChoosePhoto),
                    );
                  },
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      // CONTACT PROFILE PHOTO
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            Provider.of<HomeProvider>(context, listen: true)
                                    .getPlatformMode()
                                ? const Color(0xff9ea3b0)
                                : Theme.of(context).colorScheme.inversePrimary,
                        backgroundImage: FileImage(
                            contactProviderTrue.editScreenModel.image!),
                      ),

                      const SizedBox(
                        height: defaultPadding / 2,
                      ),

                      // ADD PHOTO BUTTON
                      Text(
                        'Edit Photo',
                        style: TextStyle(
                            color: CupertinoTheme.of(context).primaryColor,
                            fontSize: height * 0.014),
                      ),
                    ],
                  ),
                ),

                // NAME
                const Row(
                  children: [
                    Text(
                      'NAME',
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                AdaptiveOutlinedTextField(
                  controller: contactProviderTrue.editScreenModel.txtName!,
                  lable: 'Full Name',
                ),

                // PHONE NUMBER
                const SizedBox(
                  height: defaultPadding,
                ),
                const Row(
                  children: [
                    Text(
                      'PHONE NUMBER',
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                AdaptiveOutlinedTextField(
                  controller: contactProviderTrue.editScreenModel.txtNumber!,
                  lable: 'Phone Number',
                ),

                // MESSAGE
                const SizedBox(
                  height: defaultPadding,
                ),
                const Row(
                  children: [
                    Text(
                      'MESSAGE',
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                AdaptiveOutlinedTextField(
                  controller: contactProviderTrue.editScreenModel.txtMessage!,
                  lable: 'Chat Conversation',
                ),
              ],
            ),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                child: const Text("Save"),
                onPressed: () {
                  ScreenModel screenModel = contactProviderTrue.editScreenModel;
                  if (isAllDataFilled(screenModel: screenModel)) {
                    ContactModel contactModel = ContactModel(
                      name: screenModel.txtName!.text,
                      message: screenModel.txtMessage!.text,
                      number: screenModel.txtNumber!.text,
                      contactImg: screenModel.image!,
                      dateTime: screenModel.selectedDate!,
                      timeOfDay: screenModel.selectedTime!,
                    );
                    contactProviderFalse.updateContact(contactModel, index);
                  } else {
                    log('Warning: Please Fill All Detail!');
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        : AlertDialog(
            title: const Text("Edit Contact"),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.transparent),
                      surfaceTintColor:    MaterialStatePropertyAll(Colors.transparent),
                      shadowColor:  MaterialStatePropertyAll(Colors.transparent),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) =>
                            AdaptiveBottomActionSheetPhotoOptions(
                                takePhoto: contactProviderFalse.editTakePhoto,
                                choosePhoto:
                                    contactProviderFalse.editChoosePhoto),
                      );
                    },
                    child: Column(
                      children: [
                        const SizedBox(
                          height: defaultPadding,
                        ),
                        // CONTACT PROFILE PHOTO
                        CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              Provider.of<HomeProvider>(context, listen: true)
                                      .getPlatformMode()
                                  ? const Color(0xff9ea3b0)
                                  : Theme.of(context).colorScheme.onPrimary,
                          backgroundImage: FileImage(
                              contactProviderTrue.editScreenModel.image!),
                        ),

                        const SizedBox(
                          height: defaultPadding / 2,
                        ),

                        // ADD PHOTO BUTTON
                        Text(
                          'Edit Photo',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: height * 0.014),
                        ),
                      ],
                    ),
                  ),

                  // NAME
                  const SizedBox(height: defaultPadding),
                  const Row(
                    children: [
                      Text(
                        'NAME',
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  AdaptiveOutlinedTextField(
                    controller: contactProviderTrue.editScreenModel.txtName!,
                    lable: 'Full Name',
                  ),

                  // PHONE NUMBER
                  const SizedBox(height: defaultPadding),
                  const Row(
                    children: [
                      Text(
                        'PHONE NUMBER',
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  AdaptiveOutlinedTextField(
                    controller: contactProviderTrue.editScreenModel.txtNumber!,
                    lable: 'Phone Number',
                  ),

                  // MESSAGE
                  const SizedBox(height: defaultPadding),
                  const Row(
                    children: [
                      Text(
                        'MESSAGE',
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  AdaptiveOutlinedTextField(
                    controller: contactProviderTrue.editScreenModel.txtMessage!,
                    lable: 'Chat Conversation',
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  ScreenModel screenModel = contactProviderTrue.editScreenModel;
                  if (isAllDataFilled(screenModel: screenModel)) {
                    ContactModel contactModel = ContactModel(
                      name: screenModel.txtName!.text,
                      message: screenModel.txtMessage!.text,
                      number: screenModel.txtNumber!.text,
                      contactImg: screenModel.image!,
                      dateTime: screenModel.selectedDate!,
                      timeOfDay: screenModel.selectedTime!,
                    );
                    contactProviderFalse.updateContact(contactModel, index);
                  } else {
                    log('Warning: Please Fill All Detail!');
                  }
                  Navigator.of(context).pop();
                },
                child: const Text("Save"),
              ),
            ],
          );
  }
}
