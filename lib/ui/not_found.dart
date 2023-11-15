import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("404 Not Found"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Error"),
            const SizedBox(height: 20.0),
            ElevatedButton(
                onPressed: () => context.goNamed("dashboard"),
                child: const Text("Go Back"))
          ],
        ),
      ),
    );
  }
}
