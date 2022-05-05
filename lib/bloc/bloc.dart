import 'package:bloc/bloc.dart';
import 'package:blocks/bloc/envento.dart';
import 'package:blocks/bloc/estado.dart';

const String direccion =
    'https://media.revistavanityfair.es/photos/60e83e15a5768ac18af67d36/master/w_1600%2Cc_limit/170566.jpg';

class MiBloc extends Bloc<Evento, Estado> {
  int numeroGuardado = 0;
  MiBloc() : super(EstadoNumero(0)) {
    on<EventoSuma>((event, emit) {
      numeroGuardado++;
      emit(EstadoNumero(numeroGuardado));
    });
    on<EventoResta>((event, emit) {
      numeroGuardado--;
      emit(EstadoNumero(numeroGuardado));
    });
    on<EventoIncrementa>((EventoIncrementa event, emit) {
      numeroGuardado = numeroGuardado + event.cantidad;
      if (numeroGuardado >= 5 && numeroGuardado <= 7) {
        emit(EstadoNumeroRomano(numeroGuardado));
      }
      if (numeroGuardado == 10) {
        emit(EstadoImagen(direccion));
      } else {
        emit(EstadoNumero(numeroGuardado));
      }
    });
  }
}
