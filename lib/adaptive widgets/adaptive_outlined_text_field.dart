import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

class AdaptiveOutlinedTextField extends StatelessWidget {
  const AdaptiveOutlinedTextField(
      {super.key, required this.controller, this.lable});

  final TextEditingController controller;
  final String? lable;

  @override
  Widget build(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
        ? CupertinoTextField(
            placeholder: lable ?? 'Enter Here',
            controller: controller,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadiusDirectional.circular(4)),
          )
        : SizedBox(
            width: width,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: lable ?? 'Enter Here',
                border: const OutlineInputBorder(),
              ),
            ),
          );
  }
}
