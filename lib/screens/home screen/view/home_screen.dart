import 'package:flutter/cupertino.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/utils/constant.dart';
import 'package:provider/provider.dart';

import 'components/cupertino_app.dart';
import 'components/material_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    HomeProvider homeProviderTrue =
    Provider.of<HomeProvider>(context, listen: true);

    // RETURNING PLATFORM BASED ON SWITCH VALUE (MATERIAL / CUPERTINO)
    return homeProviderTrue.getPlatformMode()
        ? const IosPlatformApp()
        : const AndroidPlatformApp();
  }
}
