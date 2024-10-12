import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:get/get.dart';
import 'package:jmc_test/app/config/languages/app_languages.dart';
import 'package:jmc_test/app/config/themes/app_colors.dart';
import 'package:jmc_test/app/config/themes/app_themes.dart';
import 'package:jmc_test/app/shared/utils/my_behavior.dart';
import 'package:jmc_test/app/shared/widgets/builder/background_safe_area.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
      title: "JMC Test",
      theme: AppThemes.lightTheme(),
      darkTheme: AppThemes.darkTheme(),
      themeMode: AppThemes().init(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('id', 'ID'),
      defaultTransition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 250),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('id', 'ID'),
      ],
      translations: AppLanguages(),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: BackgroundSafeArea(
            content: child ?? Container(),
          ),
        );
      },
    );
  }
}
