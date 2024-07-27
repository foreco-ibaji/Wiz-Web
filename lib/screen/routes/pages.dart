import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wiz_web/screen/modules/home/home_bindings.dart';
import 'package:wiz_web/screen/modules/home/home_screen.dart';

import '../modules/ai-search/ai_search_binding.dart';
import '../modules/ai-search/ai_search_view.dart';
import 'routes.dart';

class Pages {
  static final routes = [
    // GetPage(
    //   title: "로그인 화면",
    //   name: Routes.login,
    //   page: () => const LoginScreen(),
    //   transition: Transition.noTransition,
    //   binding: LoginBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    // ),
    GetPage(
      title: "메인 화면",
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.noTransition,
      binding: HomeBindings(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: "검색 화면",
      name: Routes.aiSearch,
      page: () => const AiSearchView(),
      transition: Transition.noTransition,
      binding: AiSearchBinding(),
      curve: Curves.easeIn,
      popGesture: false,
    ),
    // GetPage(
    //   title: "홈 화면",
    //   name: Routes.home,
    //   page: () => const HomeScreen(),
    //   transition: Transition.noTransition,
    //   binding: HomeBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    // ),
    // GetPage(
    //   title: "세부 품목 화면",
    //   name: Routes.detail,
    //   page: () => const DetailMethodScreen(),
    //   transition: Transition.native,
    //   binding: DetailMethodBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    //   children: [],
    // ),
    // GetPage(
    //   title: "카메라 화면",
    //   name: Routes.camera,
    //   page: () => const CameraScreen(),
    //   transition: Transition.noTransition,
    //   binding: CameraBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    // ),
    // GetPage(
    //   title: "지도 화면",
    //   name: Routes.map,
    //   page: () => const MapScreen(),
    //   transition: Transition.noTransition,
    //   binding: MapBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    // ),
    // GetPage(
    //   title: "미션 화면",
    //   name: Routes.mission,
    //   page: () => const MissionScreen(),
    //   transition: Transition.noTransition,
    //   binding: MissionBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    // ),
    // GetPage(
    //   title: "미션 상세 화면",
    //   name: Routes.missionDetail,
    //   page: () => const MissionDetailScreen(),
    //   transition: Transition.noTransition,
    //   binding: MissionDetailBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    // ),
    // GetPage(
    //   title: "마이 페이지 화면",
    //   name: Routes.mypage,
    //   page: () => const MyPageScreen(),
    //   binding: MyPageBinding(),
    //   curve: Curves.easeIn,
    //   popGesture: false,
    // )
  ];
}
