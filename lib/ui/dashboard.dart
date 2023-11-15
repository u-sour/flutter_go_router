import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  String name = "Sour.Dev";
                  // route path
                  // context.go("/profile/$name");
                  // route name
                  context.goNamed("profile", pathParameters: {"name": name});
                },
                child: const Text("Profile")),
            const SizedBox(height: 20.0),
            // note: "push" will stack up page on each other and "go" it doesn't
            ElevatedButton(
                onPressed: () => context.pushNamed("pageA"),
                child: const Text("pushNamed Page A"))
          ],
        ),
      ),
    );
  }
}
