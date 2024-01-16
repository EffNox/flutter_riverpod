import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 5;

  void icreaseByOne() {
    state = state + 1;
  }
}

@Riverpod(keepAlive: true)
class DarkMode extends _$DarkMode {
  @override
  bool build() => true;

  void toggleDarkMode() => state = !state;
}

@riverpod
class Username extends _$Username {
  @override
  String build() => 'EffNox';

  void changeName(String name) => state = name;
}
