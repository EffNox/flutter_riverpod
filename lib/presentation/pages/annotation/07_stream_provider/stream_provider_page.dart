import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/annotation/stream_provider.dart';

class StreamProviderPage extends StatelessWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App StreamProviderPage')),
      body: const StreamWidget(),
    );
  }
}

class StreamWidget extends ConsumerWidget {
  const StreamWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final names$ = ref.watch(usersInChatProvider);

    if (names$.isLoading) return const CircularProgressIndicator();
    if (names$.hasError) return Text('${names$.error}');

    final names = names$.value!;

    return ListView.builder(
      itemCount: names.length,
      itemBuilder: (_, i) => ListTile(title: Text(names[i])),
    );

    // return names$.when(
    //   data: (names) => ListView.builder(
    //     itemCount: names.length,
    //     itemBuilder: (_, i) => ListTile(title: Text(names[i])),
    //   ),
    //   error: (error, _) => Text('$error'),
    //   loading: () => const CircularProgressIndicator(),
    // );
  }
}
