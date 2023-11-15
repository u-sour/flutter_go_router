import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page B"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is page B."),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => context.pushNamed("pageC"),
              child: const Text("pushNamed Page C"),
            )
          ],
        ),
      ),
    );
  }
}
