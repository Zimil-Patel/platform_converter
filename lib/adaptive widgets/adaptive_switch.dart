import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class AdaptiveSwitch extends StatelessWidget {
  const AdaptiveSwitch({super.key, required this.value, required this.method});

  final bool value;
  final void Function(bool) method;

  @override
  Widget build(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
        ? CupertinoSwitch(
            value: value,
            onChanged: (value) => method(value),
          )
        : Switch(
            value: value,
            onChanged: (value) => method(value),
          );
  }
}
