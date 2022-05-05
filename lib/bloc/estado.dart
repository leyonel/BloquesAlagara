// ignore_for_file: public_member_api_docs, sort_constructors_first
class Estado {}

class EstadoNumero extends Estado {
  final int numero;
  EstadoNumero(this.numero);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EstadoNumero && other.numero == numero;
  }

  @override
  int get hashCode => numero.hashCode;
}

class EstadoImagen extends Estado {
  final String numero;
  EstadoImagen(this.numero);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EstadoImagen && other.numero == numero;
  }

  @override
  int get hashCode => numero.hashCode;
}

class EstadoNumeroRomano extends Estado {
  final int numero;

  EstadoNumeroRomano(this.numero);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EstadoNumeroRomano && other.numero == numero;
  }

  @override
  int get hashCode => numero.hashCode;
}
