import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reelshop/app/shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "reelshop",
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      themeMode: ThemeMode.system,
    ).modular();
  }
}
