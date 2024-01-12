import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('River App')),
      body: const HomeViewWidget(),
    );
  }
}

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTileWidget(title: 'State Provider', subTitle: 'Un estado simple', location: '/state-provider'),
        _CustomListTileWidget(title: 'Future Provider', subTitle: 'Un simple Future + Family', location: '/future-provider'),
        _CustomListTileWidget(title: 'Stream Provider', subTitle: 'Un simple Stream', location: '/stream-provider'),
        _CustomListTileWidget(title: 'Notifier Provider', subTitle: 'Un provider con estado personalizado', location: '/state-notifier-provider'),
      ],
    );
  }
}

class _CustomListTileWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;

  const _CustomListTileWidget({required this.title, required this.subTitle, required this.location});
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return ListTile(
      title: Text(title, style: titleStyle),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: () => context.push(location),
    );
  }
}
