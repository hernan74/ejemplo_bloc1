import 'package:animacion/bloc/contador/contador_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Animacion')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Formulario(),
            Spacer(),
            BlocBuilder<ContadorBloc, ContadorState>(
              builder: (_, state) {
                return Text(
                  '${state.numero}',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                );
              },
            ),
            Spacer()
          ],
        ),
        floatingActionButton: _BotonFlotante());
  }
}

class _Formulario extends StatelessWidget {
  const _Formulario({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = new TextEditingController();
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
        ),
        MaterialButton(
            child: Text('Cambiar Valor'),
            color: Colors.blue,
            onPressed: () {
              context
                  .read<ContadorBloc>()
                  .add(OnSetearValorContador(controller.text));
            })
      ],
    );
  }
}

class _BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contadorBloc = context.read<ContadorBloc>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
            child: Icon(Icons.plus_one),
            onPressed: () {
              contadorBloc.add(OnIncrementarContador());
            }),
        FloatingActionButton(
            child: Icon(Icons.exposure_minus_1),
            onPressed: () {
              contadorBloc.add(OnDecrementarContador());
            }),
        FloatingActionButton(
            child: Icon(Icons.restart_alt),
            onPressed: () {
              contadorBloc.add(OnRestablecerContador());
            })
      ],
    );
  }
}
