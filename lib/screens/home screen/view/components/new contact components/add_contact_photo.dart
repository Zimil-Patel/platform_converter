import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/adaptive%20widgets/adaptive_bottom_action_sheet_photo_option.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

class AddContactPhoto extends StatelessWidget {
  const AddContactPhoto({
    super.key,
    required this.homeProviderTrue,
  });

  final HomeProvider homeProviderTrue;

  @override
  Widget build(BuildContext context) {
    ContactProvider contactProviderTrue =
    Provider.of<ContactProvider>(context, listen: true);
    ContactProvider contactProviderFalse =
    Provider.of<ContactProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            homeProviderTrue.getPlatformMode()
                ? showCupertinoModalPopup(
              context: context,
              builder: (context) => AdaptiveBottomActionSheetPhotoOptions(choosePhoto: contactProviderFalse.choosePhoto, takePhoto: contactProviderFalse.takePhoto,),
            )
                : showModalBottomSheet(
              context: context,
              builder: (context) => AdaptiveBottomActionSheetPhotoOptions(choosePhoto: contactProviderFalse.choosePhoto, takePhoto: contactProviderFalse.takePhoto,),
            );
          },
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              // CONTACT PROFILE PHOTO
              CircleAvatar(
                radius: 50,
                backgroundColor: homeProviderTrue.getPlatformMode()
                    ? const Color(0xff9ea3b0)
                    : Theme
                    .of(context)
                    .colorScheme
                    .inversePrimary,
                child: homeProviderTrue.getPlatformMode()
                    ? Container(
                  margin: EdgeInsets.all(
                      contactProviderTrue.screenModel.image != null
                          ? 0
                          : 20),
                  decoration: contactProviderTrue.screenModel.image !=
                      null
                      ? BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(
                          contactProviderTrue.screenModel.image!),
                    ),
                  )
                      : const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/person.png'),
                    ),
                  ),
                )
                    : contactProviderTrue.screenModel.image != null
                    ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                            contactProviderTrue.screenModel.image!),
                      ),
                    ))
                    : const Icon(Icons.add_a_photo_outlined),
              ),

              const SizedBox(
                height: defaultPadding,
              ),

              // ADD PHOTO BUTTON
              const Text('Add Photo'),
            ],
          ),
        ),
      ),
    );
  }
}
