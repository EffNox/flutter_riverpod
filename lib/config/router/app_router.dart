import 'package:go_router/go_router.dart';
import 'package:river_app/presentation/pages/annotation/02_provider_router/router_page.dart';
import 'package:river_app/presentation/pages/pages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    // initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (_, __) => const HomePage()),
      GoRoute(path: '/state-provider', builder: (_, __) => const StateProviderPage()),
      GoRoute(path: '/future-provider', builder: (_, __) => const PokemonPage()),
      GoRoute(path: '/stream-provider', builder: (_, __) => const StreamPage()),
      GoRoute(path: '/state-notifier-provider', builder: (_, __) => const TodosPage()),
      GoRoute(path: '/@provider', builder: (_, __) => const ProviderPage()),
      GoRoute(path: '/@router', builder: (_, __) => const RouterPage()),
      GoRoute(path: '/@state_provider', builder: (_, __) => const StateProvider2Page()),
      GoRoute(path: '/@todos', builder: (_, __) => const Todos2Page()),
      GoRoute(path: '/@future-prodiver', builder: (_, __) => const FutureProvider2Page()),
      GoRoute(path: '/@family-future-prodiver', builder: (_, __) => const FamilyFuturePage()),
      GoRoute(path: '/@stream-prodiver', builder: (_, __) => const StreamProviderPage()),
    ],
  );
}
