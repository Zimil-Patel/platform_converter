import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';

class AddContactPhoto extends StatelessWidget {
  const AddContactPhoto({
    super.key,
    required this.homeProviderTrue,
  });

  final HomeProvider homeProviderTrue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Center(
        child: CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              // CONTACT PROFILE PHOTO
              CircleAvatar(
                radius: 50,
                backgroundColor: homeProviderTrue.getPlatformMode()
                    ? const Color(0xff9ea3b0)
                    : Theme.of(context).colorScheme.inversePrimary,
                child: homeProviderTrue.getPlatformMode()
                    ? Container(
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage('assets/person.png'),
                      )),
                )
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
