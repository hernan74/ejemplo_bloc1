part of 'contador_bloc.dart';

@immutable
abstract class ContadorEvent {}

class OnIncrementarContador extends ContadorEvent {
  OnIncrementarContador();
}

class OnDecrementarContador extends ContadorEvent {
  OnDecrementarContador();
}

class OnRestablecerContador extends ContadorEvent {
  OnRestablecerContador();
}

class OnSetearValorContador extends ContadorEvent {
  final String valor;
  OnSetearValorContador(this.valor);
}
