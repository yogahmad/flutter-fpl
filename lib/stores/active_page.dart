import 'package:fpl/components/sidebar.dart';
import 'package:mobx/mobx.dart';

part 'active_page.g.dart';

class ActivePageStore = _ActivePageStore with _$ActivePageStore;

abstract class _ActivePageStore with Store {
  @observable
  String activePage = SidebarItemList.pickTeam;

  @action
  void changeActivePage(newPage) {
    activePage = newPage;
  }
}
