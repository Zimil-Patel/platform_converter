import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class AdaptiveLisTile extends StatelessWidget {
  const AdaptiveLisTile(
      {super.key,
      required this.title,
      this.leading,
      this.trailing,
      required this.subTitle});

  final String title;
  final String subTitle;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Provider.of<HomeProvider>(context, listen: true).getPlatformMode()
        ? CupertinoListTile(
            title: Text(title),
            leading: leading,
            trailing: trailing,
            subtitle: Text(subTitle),
          )
        : ListTile(
            title: Text(title),
            leading: leading,
            trailing: trailing,
            subtitle: Text(subTitle),
          );
  }
}
