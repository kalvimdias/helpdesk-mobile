enum StatusChamado { novo, emAtendimento, aguardandoCliente, finalizado }

class Chamado {
  final int id;
  final String titulo;
  final String descricao;

  final String cliente;

  final String tecnicoResponsavel;

  final DateTime dataAbertura;

  final StatusChamado status;

  const Chamado({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.cliente,
    required this.tecnicoResponsavel,
    required this.dataAbertura,
    required this.status,
  });
}
