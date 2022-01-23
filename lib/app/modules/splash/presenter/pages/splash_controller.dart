import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part "splash_controller.g.dart";

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  _SplashControllerBase();

  validationUserAuth() {
    Timer(const Duration(seconds: 5), () {
      Modular.to.pushReplacementNamed("/start/feed/");
    });
  }
}
