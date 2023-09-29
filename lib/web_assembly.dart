library web_assembly;

import 'package:web_assembly/wasm/wasm_loader.dart';

class WebCounter {
  late WasmLoader _loader;
  var counter = 0;

  WebCounter() {
    _loader = WasmLoader(path: 'assets/wasm/release.wasm');
    await _loaded();
  }

  Future<bool> _loaded() async {
    return await _loader.initialized();
  }

  void incrementCounter() {
    counter = _loader.callfunc('plusOne', counter) as int;
  }

  void decrementCounter() {
    counter = _loader.callfunc('minusOne', counter) as int;
  }
}
