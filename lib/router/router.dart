// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppRouter {
  String name;
  String path;
  AppRouter({
    required this.name,
    required this.path,
  });
}

class Routers {
  static AppRouter onboardingscreen = AppRouter(name: "/OnBoard", path: "/");
  static AppRouter homepage = AppRouter(name: "/home", path: "/home");
}
