import 'package:get/get.dart';
import 'package:skincaredemo/UI/screens/MainSection/main_bidings.dart';
import 'package:skincaredemo/UI/screens/MainSection/main_screen.dart';
import 'package:skincaredemo/UI/screens/RoutineSection/routine_bidings.dart';
import 'package:skincaredemo/UI/screens/RoutineSection/routine_screen.dart';
import 'package:skincaredemo/UI/screens/StreaksSection/streaks_bidings.dart';
import 'package:skincaredemo/UI/screens/StreaksSection/streaks_screen.dart';
import 'package:skincaredemo/infrastructure/commons/constants/app_routes.dart';

class AppPages {
  static String initial = RoutesConstants.mainScreen;
  static final routes = [
    GetPage(
      name: RoutesConstants.dashBoardScreen,
      page: () => const RoutineScreen(),
      binding: DashBoardBinding(),
    ),
    GetPage(
      name: RoutesConstants.mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RoutesConstants.intakeScreen,
      page: () => const StreaksScreen(),
      binding: IntakeBinding(),
    ),
  ];
}
