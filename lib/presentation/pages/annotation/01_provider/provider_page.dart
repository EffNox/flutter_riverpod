import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final helloWorld = ref.watch(helloWorldProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('App ProviderPage')),
      body: Center(child: Text(helloWorld)),
    );
  }
}
