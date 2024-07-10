import 'package:flutter/material.dart';
import 'package:my_app/config/route/route.dart';
import 'package:my_app/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme, // 라이트 테마를 적용합니다.
      darkTheme: AppTheme.darkTheme, // 다크 테마를 적용합니다.
      themeMode: ThemeMode.system,
    );
  }
}
