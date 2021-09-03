import 'package:animacion/bloc/contador/contador_bloc.dart';
import 'package:animacion/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContadorBloc>(create: (_) => ContadorBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage()},
      ),
    );
  }
}
