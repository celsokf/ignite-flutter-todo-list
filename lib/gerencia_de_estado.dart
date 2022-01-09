abstract class GerenciaDeEstado<T> {
  late T _state;
  final _listens = <Function(T state)>[];

  GerenciaDeEstado({required T initialState}) {
    _state = initialState;
  }

  T get state => _state;

  void setState(T state) {
    _state = state;
    _update();
  }

  void _update() {
    for (var i = 0; i < _listens.length; i++) {
      _listens[i](_state);
    }
  }

  void listen(void Function(T state) onUpdate) {
    _listens.add(onUpdate);
  }
}
