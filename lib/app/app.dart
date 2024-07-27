import 'package:goground/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:goground/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:goground/ui/views/home/home_view.dart';
import 'package:goground/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:goground/ui/views/testing_custom_scroll_view/testing_custom_scroll_view_view.dart';
import 'package:goground/ui/views/test2/test2_view.dart';
import 'package:goground/ui/views/test3/test3_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TestingCustomScrollViewView),
    MaterialRoute(page: Test2View),
    MaterialRoute(page: Test3View),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
