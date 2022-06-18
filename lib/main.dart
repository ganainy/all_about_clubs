import 'package:all_about_clubs/customization/theme.dart';
import 'package:all_about_clubs/providers/home_provdier.dart';
import 'package:all_about_clubs/repositories/ClubsRepository.dart';
import 'package:all_about_clubs/screens/home/home.dart';
import 'package:all_about_clubs/utils/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DioHelper.init();
  runApp(EasyLocalization(
      //in the future other locales can be added here
      supportedLocales: const [Locale('de', 'DE')],
      path: 'assets/translations',
      fallbackLocale: const Locale('de', 'DE'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
          1080, 2280), //the width and height of the emulator iam developing on
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (BuildContext context) => HomeProvider(ClubsRepository()),
          child: MaterialApp(
            //related to supporting multiple languages
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: AppStrings.appName,
            theme: MyTheme.lightTheme,
            home: const HomeScreen(),
          ),
        );
      },
    );
  }
}
