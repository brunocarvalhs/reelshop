import 'package:flutter_modular/flutter_modular.dart';
import 'package:reelshop/app/modules/feed/presenter/pages/feed_screen.dart';
import 'package:reelshop/app/modules/feed/presenter/feed_viewmodel.dart';

class FeedModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => FeedViewModel()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const FeedScreen()),
  ];
}
