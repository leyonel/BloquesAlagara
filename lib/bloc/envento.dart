class Evento {}

class EventoResta implements Evento {}

class EventoSuma implements Evento {}

class EventoIncrementa implements Evento {
  final int cantidad;
  EventoIncrementa(this.cantidad);
}
