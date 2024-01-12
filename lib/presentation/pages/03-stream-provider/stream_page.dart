import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StreamPage extends ConsumerWidget {
  const StreamPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomNames = ref.watch(namesStreamProvider);

    final textStyle = Theme.of(context).textTheme.titleMedium;

    if (!randomNames.hasValue) {}

    return Scaffold(
      appBar: AppBar(),
      body: randomNames.when(
        data: (v) => Center(child: Text(v, style: textStyle)),
        error: (error, stackTrace) => Text('$error'),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
