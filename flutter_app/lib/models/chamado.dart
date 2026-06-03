enum StatusChamado { novo, emAtendimento, aguardandoCliente, finalizado }

class Chamado {
  final int id;
  final String titulo;
  final String descricao;
  final StatusChamado status;

  const Chamado({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.status,
  });
}
