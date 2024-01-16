import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/router/app_router.dart';

class RouterPage extends ConsumerWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('App RouterPage')),
      body: const Center(
        child: Placeholder(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          ref.read(appRouterProvider).pop();
          // context.pop();
        },
      ),
    );
  }
}
