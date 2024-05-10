import 'package:flutter/material.dart';
import 'package:platform_converter/screens/home%20screen/provider/contact_provider.dart';
import 'package:platform_converter/screens/home%20screen/provider/home_provider.dart';
import 'package:platform_converter/screens/home%20screen/view/home_screen.dart';
import 'package:platform_converter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => ContactProvider(),),
      ],
      child: const PlatformConverterApp()));
}

class PlatformConverterApp extends StatelessWidget {
  const PlatformConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}
