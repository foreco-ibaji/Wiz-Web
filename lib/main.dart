import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wiz_web/screen/modules/home/home_bindings.dart';

import 'screen/routes/pages.dart';
import 'screen/routes/routes.dart';
import 'screen/style/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = NoCheckCertificateHttpOverrides();
  await dotenv.load(fileName: ".env");

  /// * GetStorage 초기화
  await GetStorage.init();
  //
  // KakaoSdk.init(
  //   nativeAppKey: dotenv.env['KAKAO_API_KEY'].toString(),
  // );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ((context, child) {
        return GetMaterialApp(
          getPages: Pages.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            fontFamily: 'Pretendard',
          ),
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          initialRoute: "/home",
          initialBinding: HomeBindings(),
          smartManagement: SmartManagement.full,
          navigatorKey: Get.key,
        );
      }),
    );
  }
}

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
