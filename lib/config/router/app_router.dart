import 'package:go_router/go_router.dart';
import 'package:river_app/presentation/pages/pages.dart';

final appRouter = GoRouter(
  // initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/state-provider',
      builder: (context, state) => const StateProviderPage(),
    ),
    GoRoute(
      path: '/future-provider',
      builder: (context, state) => const PokemonPage(),
    ),
    GoRoute(
      path: '/stream-provider',
      builder: (context, state) => const StreamPage(),
    ),
    GoRoute(
      path: '/state-notifier-provider',
      builder: (context, state) => const TodosPage(),
    ),
  ],
);
