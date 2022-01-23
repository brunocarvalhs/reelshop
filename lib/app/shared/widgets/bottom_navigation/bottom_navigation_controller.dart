import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part "bottom_navigation_controller.g.dart";

@Injectable()
class BottomNavigationController = _BottomNavigationControllerBase with _$BottomNavigationController;

abstract class _BottomNavigationControllerBase with Store {
  _BottomNavigationControllerBase();

  @observable
  int pageIndex = 0;

  @computed
  bool get pageInit => pageIndex == 0;

  @action
  void selectedPage(int index) {
    pageIndex = index;
    redirect();
  }

  void redirect() {
    switch (pageIndex) {
      case 0:
        Modular.to.navigate("/start/feed/");
        break;
      case 1:
        Modular.to.navigate("/start/messages/");
        break;
      case 2:
        Modular.to.navigate("/start/profile/");
        break;
      case 3:
        Modular.to.navigate("/start/search/");
        break;
    }
  }
}
