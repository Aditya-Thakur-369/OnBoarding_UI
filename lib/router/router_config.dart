import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_ui/router/router.dart';
import 'package:onboarding_ui/screens/home_screen.dart';
import 'package:onboarding_ui/screens/onboarding_screen.dart';

final router = GoRouter(routes: [
  GoRoute(path: Routers.homepage.path, name: Routers.homepage.name,pageBuilder: (context, state) {
    return const CupertinoPage(child: HomePage());
  },),
  GoRoute(path: Routers.onboardingscreen.path, name: Routers.onboardingscreen.name, pageBuilder: (context, state) {
    return const CupertinoPage(child: OnBoardingScreen());
  },),
]);
