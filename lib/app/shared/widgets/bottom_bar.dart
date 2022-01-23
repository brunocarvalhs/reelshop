import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:reelshop/app/modules/feed/presenter/feed_viewmodel.dart';
import 'package:reelshop/app/shared/utils/tik_tok_icons_icons.dart';

class BottomBar extends StatelessWidget {
  static const double navigationIconSize = 20.0;
  static const double createButtonWidth = 38.0;

  const BottomBar({Key? key}) : super(key: key);

  Widget get customCreateIcon => SizedBox(
        width: 45.0,
        height: 27.0,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10.0),
              width: createButtonWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              width: createButtonWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            Center(
              child: Container(
                height: double.infinity,
                width: createButtonWidth,
                decoration: BoxDecoration(
                  color: Modular.get<FeedViewModel>().actualScreen == 0 ? Colors.white : Colors.black,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Icon(
                  Icons.add,
                  color: Modular.get<FeedViewModel>().actualScreen == 0 ? Colors.black : Colors.white,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black12),
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuButton('Home', TikTokIcons.home, 0),
              menuButton('Search', TikTokIcons.search, 1),
              const SizedBox(
                width: 15,
              ),
              customCreateIcon,
              const SizedBox(
                width: 15,
              ),
              menuButton('Messages', TikTokIcons.messages, 2),
              menuButton('Profile', TikTokIcons.profile, 3)
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 40 : 10,
          )
        ],
      ),
    );
  }

  Widget menuButton(String text, IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        Modular.get<FeedViewModel>().setActualScreen(index);
      },
      child: SizedBox(
        height: 45,
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Modular.get<FeedViewModel>().actualScreen == 0
                  ? Modular.get<FeedViewModel>().actualScreen == index
                      ? Colors.white
                      : Colors.white70
                  : Modular.get<FeedViewModel>().actualScreen == index
                      ? Colors.black
                      : Colors.black54,
              size: navigationIconSize,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: Modular.get<FeedViewModel>().actualScreen == index ? FontWeight.bold : FontWeight.normal,
                color: Modular.get<FeedViewModel>().actualScreen == 0
                    ? Modular.get<FeedViewModel>().actualScreen == index
                        ? Colors.white
                        : Colors.white70
                    : Modular.get<FeedViewModel>().actualScreen == index
                        ? Colors.black
                        : Colors.black54,
                fontSize: 11.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
