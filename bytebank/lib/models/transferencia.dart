

class Transferencia {
  final double valor;
  final int tipoConta;

  Transferencia(this.valor, this.tipoConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, tipoConta: $tipoConta}';
  }
}
