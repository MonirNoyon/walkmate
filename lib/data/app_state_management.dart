

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationState extends StateNotifier<bool>{
  ApplicationState():super(false);

  void toggle() {
    state = !state;
  }

}

final appState = StateNotifierProvider<ApplicationState, bool>(
      (ref) => ApplicationState(),
);