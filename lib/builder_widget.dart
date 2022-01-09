import 'package:flutter/material.dart';
import 'gerencia_de_estado.dart';

class BuilderWidget<T> extends StatefulWidget {
  final GerenciaDeEstado<T> controller;
  final Widget Function(BuildContext context, T state) builder;

  const BuilderWidget({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  _BuilderWidgetState<T> createState() => _BuilderWidgetState<T>();
}

class _BuilderWidgetState<T> extends State<BuilderWidget<T>> {
  @override
  void initState() {
    widget.controller.listen((state) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, widget.controller.state);
  }
}
