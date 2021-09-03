part of 'contador_bloc.dart';

@immutable
class ContadorState {
  final int numero;

  ContadorState({this.numero = 0});

  ContadorState copyWith({int? numero}) =>
      ContadorState(numero: numero ?? this.numero);

  ContadorState iniState() => new ContadorState();
}
