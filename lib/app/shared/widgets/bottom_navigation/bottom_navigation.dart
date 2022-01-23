import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:reelshop/app/shared/utils/tik_tok_icons_icons.dart';
import 'package:reelshop/app/shared/widgets/bottom_navigation/bottom_navigation_controller.dart';

class BottomNavigationWidget extends StatefulWidget {
  final String title;
  const BottomNavigationWidget({Key? key, this.title = 'BottomNavigationWidget'}) : super(key: key);
  @override
  BottomNavigationWidgetState createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends ModularState<BottomNavigationWidget, BottomNavigationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.pageIndex,
        onTap: (index) => controller.selectedPage(index),
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(TikTokIcons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
            icon: Icon(TikTokIcons.search),
            label: "Search",
          ),
          const BottomNavigationBarItem(
            icon: Icon(TikTokIcons.messages),
            label: "Messages",
          ),
          const BottomNavigationBarItem(
            icon: Icon(TikTokIcons.profile),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
