import 'package:blocks/bloc/bloc.dart';
import 'package:blocks/bloc/envento.dart';
import 'package:blocks/bloc/estado.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roman_numbers/roman_numbers.dart';

void main() {
  runApp(const AplicacionBloc());
}

class AplicacionBloc extends StatefulWidget {
  const AplicacionBloc({Key? key}) : super(key: key);

  @override
  State<AplicacionBloc> createState() => _AplicacionBlocState();
}

class _AplicacionBlocState extends State<AplicacionBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MiBloc(),
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatefulWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  State<Aplicacion> createState() => _AplicacionState();
}

class _AplicacionState extends State<Aplicacion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter bloc'),
        ),
        body: const MiwidgetEstado(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                var b = context.read<MiBloc>();
                //Puede ser de la otra manera de Evento Resta
                b.add(EventoIncrementa(-1));
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 5,
            ),
            FloatingActionButton(
              onPressed: () {
                var b = context.read<MiBloc>();
                //Puede ser de la otra manera de Evento Suma
                b.add(EventoIncrementa(1));
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class MiwidgetEstado extends StatefulWidget {
  const MiwidgetEstado({Key? key}) : super(key: key);

  @override
  State<MiwidgetEstado> createState() => _MiwidgetEstadoState();
}

class _MiwidgetEstadoState extends State<MiwidgetEstado> {
  @override
  Widget build(BuildContext context) {
    var estado = context.watch<MiBloc>().state;
    if (estado is EstadoImagen) {
      return MiWidgetImagen(estado);
    }
    if (estado is EstadoNumero) {
      return MiWidgetNumero(estado);
    }

    if (estado is EstadoNumeroRomano) {
      return MiWidgetNumeroRomano(estado);
    }

    return Container();
  }
}

class MiWidgetNumero extends StatelessWidget {
  final EstadoNumero estado;
  const MiWidgetNumero(this.estado, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${estado.numero}',
        style: const TextStyle(fontSize: 60),
      ),
    );
  }
}

class MiWidgetImagen extends StatelessWidget {
  final EstadoImagen estado;
  const MiWidgetImagen(this.estado, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var estado = context.watch<MiBloc>().state;
    if (estado is EstadoImagen) {
      return Image.network(estado.numero);
    }
    if (estado is EstadoNumero) {
      return MiWidgetNumero(estado);
    }
    return Container();
  }
}

class MiWidgetNumeroRomano extends StatelessWidget {
  final EstadoNumeroRomano estado;
  const MiWidgetNumeroRomano(this.estado, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cadena = RomanNumbers.toRoman(estado.numero);
    return Center(
      child:
          Text(cadena, style: const TextStyle(fontSize: 60, color: Colors.red)),
    );
  }
}
