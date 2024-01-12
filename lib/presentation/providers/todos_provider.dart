import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:river_app/domain/entities/todo.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) => TodosNotifier());

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier()
      : super([
          Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
          Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
          Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: DateTime.now()),
          Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
        ]);
  void addTodo() {
    state = [
      ...state,
      Todo(id: _uuid.v4(), description: RandomGenerator.getRandomName(), completedAt: null),
    ];
  }

  void toggleTodo(String id) {
    state = state.map((e) {
      if (e.id != id) return e;
      if (e.done) return e.copyWith(completedAt: null);
      return e.copyWith(completedAt: DateTime.now());
    }).toList();
  }
}
