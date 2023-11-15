import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page A"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is page A."),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => context.pushNamed("pageB"),
              child: const Text("pushNamed Page B"),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => context.pop(),
              child: const Text("back"),
            )
          ],
        ),
      ),
    );
  }
}
