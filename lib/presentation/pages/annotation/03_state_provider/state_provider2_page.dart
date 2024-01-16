import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:river_app/presentation/providers/annotation/state_providers.dart';

class StateProvider2Page extends ConsumerWidget {
  const StateProvider2Page({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final counter = ref.watch(counterProvider);
    final isDarkMode = ref.watch(darkModeProvider);
    final username = ref.watch(usernameProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('App StateProviderPage')),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            IconButton(
              icon: Icon(isDarkMode == true ? Icons.dark_mode_outlined : Icons.light_mode_outlined, size: 100),
              onPressed: () => ref.read(darkModeProvider.notifier).toggleDarkMode(),
            ),
            Text(username, style: const TextStyle(fontSize: 25)),
            TextButton.icon(
              onPressed: () => ref.read(counterProvider.notifier).icreaseByOne(),
              icon: const Icon(Icons.add_outlined),
              label: Text('$counter', style: const TextStyle(fontSize: 100)),
            ),
            const Spacer(flex: 2)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nombre aleatorio'),
        icon: const Icon(Icons.refresh_rounded),
        onPressed: () => ref.read(usernameProvider.notifier).changeName(RandomGenerator.getRandomName()),
      ),
    );
  }
}
