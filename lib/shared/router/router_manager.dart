import 'package:flutter/material.dart';
import 'package:my_chat/shared/theme/theme_controller.dart';
import 'package:my_chat/ui/login_page.dart';
import 'package:my_chat/ui/register_page.dart';

class RouterManager extends StatelessWidget {
  const RouterManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My dev chat",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness:
            ThemeController.theme.isDark ? Brightness.dark : Brightness.light,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/register': (_) => const RegisterPage(),
      },
    );
  }
}
