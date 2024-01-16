import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/annotation/todos_provider.dart';

class Todos2Page extends ConsumerWidget {
  const Todos2Page({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('App TodoPage')),
      body: const _TodoWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () => ref.read(todosProvider.notifier).addTodo(),
      ),
    );
  }
}

class _TodoWidget extends ConsumerWidget {
  const _TodoWidget();
  @override
  Widget build(BuildContext context, ref) {
    final currentFilter = ref.watch(todoCurrentFilterProvider);
    // final todos = ref.watch(todosProvider);
    final todos = ref.watch(filteredTodosProvider);

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la mfiesta'),
        ),
        SegmentedButton(
          segments: const [
            ButtonSegment(value: FilterType.all, icon: Text('Todos')),
            ButtonSegment(value: FilterType.completed, icon: Text('Invitados')),
            ButtonSegment(value: FilterType.pending, icon: Text('No invitados')),
          ],
          selected: <FilterType>{currentFilter},
          onSelectionChanged: (v) => ref.read(todoCurrentFilterProvider.notifier).setCurrentFilter(v.first),
        ),
        const SizedBox(height: 5),
        Expanded(
            child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return SwitchListTile(
              title: Text(todo.description),
              subtitle: Text(todo.completedAt.toString()),
              value: todo.done,
              onChanged: (v) => ref.read(todosProvider.notifier).toggleTodo(todo.id),
            );
          },
        ))
      ],
    );
  }
}
