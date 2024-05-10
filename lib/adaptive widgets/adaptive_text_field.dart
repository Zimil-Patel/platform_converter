import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField({super.key, this.hintText, required this.controller, this.textColor});

  final String? hintText;
  final TextEditingController controller;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode() ?  CupertinoTextField(
      controller: controller,
      placeholder: hintText ?? 'Enter here',
      style: null,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal:
          BorderSide(color: Colors.grey.withOpacity(0.4), width: 0.5),
        ),
      ),
    ) : SizedBox(
      width: width,
      child: TextField(
        controller: controller,
        onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
        decoration: InputDecoration(
          hintText: hintText ?? 'Enter here',
        ),
      ),
    );
  }
}
