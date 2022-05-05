import 'package:bloc_test/bloc_test.dart';
import 'package:blocks/bloc/bloc.dart';
import 'package:blocks/bloc/envento.dart';
import 'package:blocks/bloc/estado.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Mibloc cuando ', () {
    blocTest(
      'empieza el numero debe de ser cero',
      build: () => MiBloc(),
      expect: () => [],
    );
    blocTest(
      'le mando evento debe de valer 1',
      build: () => MiBloc(),
      act: (MiBloc bloc) => bloc.add(Evento()),
      expect: () => [EstadoNumero(1)],
    );

    blocTest(
      'con dos eventos debe de ser 2',
      build: () => MiBloc(),
      act: (MiBloc bloc) {
        bloc.add(Evento());
        bloc.add(Evento());
      },
      expect: () => [EstadoNumero(1), EstadoNumero(2)],
    );
  });
}
