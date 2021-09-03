import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contador_event.dart';
part 'contador_state.dart';

class ContadorBloc extends Bloc<ContadorEvent, ContadorState> {
  ContadorBloc() : super(ContadorState());

  @override
  Stream<ContadorState> mapEventToState(
    ContadorEvent event,
  ) async* {
    if (event is OnIncrementarContador) {
      final int valorActual = state.numero;

      yield state.copyWith(numero: valorActual + 1);
    } else if (event is OnDecrementarContador) {
      final int valorActual = state.numero;

      yield state.copyWith(numero: valorActual - 1);
    } else if (event is OnRestablecerContador) {
      yield state.iniState();
    } else if (event is OnSetearValorContador) {
      if (int.tryParse(event.valor) == null) return;
      yield state.copyWith(numero: int.parse(event.valor));
    }
  }
}
