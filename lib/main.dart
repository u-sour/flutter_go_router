import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'ui/login.dart';
import 'ui/not_found.dart';
import 'ui/dashboard.dart';
import 'ui/page_a.dart';
import 'ui/page_b.dart';
import 'ui/page_c.dart';
import 'ui/profile.dart';

void main() {
  runApp(MyApp());
}

bool isLoggedIn = true;

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // routes
  final GoRouter _router = GoRouter(
      initialLocation: "/",
      redirect: (context, state) {
        if (state.matchedLocation == "/") {
          return (isLoggedIn) ? "/" : "/login";
        }
        return null;
      },
      errorBuilder: (context, state) => const NotFound(),
      // debugLogDiagnostics: true,
      routes: [
        GoRoute(
            name: "login",
            path: "/login",
            builder: (context, state) => const Login()),
        GoRoute(
          name: "dashboard",
          path: "/",
          builder: (context, state) => const Dashboard(),
          // child/sub routes
          routes: [
            GoRoute(
                name: "pageA",
                path: "page-a",
                builder: (context, state) => const PageA()),
            GoRoute(
                name: "pageB",
                path: "page-b",
                builder: (context, state) => const PageB()),
            GoRoute(
                name: "pageC",
                path: "page-c",
                builder: (context, state) => const PageC()),
          ],
        ),
        GoRoute(
          name: "profile",
          path: "/profile/:name",
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: Profile(name: state.pathParameters["name"]!),
            // transitionDuration: const Duration(seconds: 1),
            // fullscreenDialog: true,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity: CurveTween(curve: Curves.easeInCirc).animate(animation),
              child: child,
            ),
          ),
        ),
      ]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
