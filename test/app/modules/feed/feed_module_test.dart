import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reelshop/app/modules/feed/feed_module.dart';

void main() {
  setUpAll(() {
    initModule(FeedModule());
  });
}
