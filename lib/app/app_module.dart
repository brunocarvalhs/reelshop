import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:reelshop/app/app_guard.dart';
import 'package:reelshop/app/shared/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:reelshop/app/shared/widgets/bottom_navigation/bottom_navigation_controller.dart';

import 'modules/feed/feed_module.dart';
import 'modules/messages/messages_module.dart';
import 'modules/profile/profile_module.dart';
import 'modules/search/search_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SplashModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.instance(Firebase.initializeApp()),
    Bind.lazySingleton((i) => BottomNavigationController())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule(), guards: [AppGuard(Modular.initialRoute)]),
    ChildRoute('/start', child: (_, args) => const BottomNavigationWidget(), children: [
      ModuleRoute("/feed", module: FeedModule()),
      ModuleRoute("/search", module: SearchModule()),
      ModuleRoute("/messages", module: MessagesModule()),
      ModuleRoute("/profile", module: ProfileModule()),
    ]),
  ];
}
