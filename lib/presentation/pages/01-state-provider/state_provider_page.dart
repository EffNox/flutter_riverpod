import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/random_name_provider.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final name = ref.watch(randomNameProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(name, style: titleStyle),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.refresh_rounded),
        onPressed: () {
          // /* final name = */ ref.read(randomNameProvider.notifier).update((state) => state.toLowerCase());
          ref.invalidate(randomNameProvider);
        },
      ),
    );
  }
}
