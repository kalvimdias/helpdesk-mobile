import '../models/chamado.dart';

class DashboardViewModel {
  final List<Chamado> chamados = [
    Chamado(
      id: 1,
      titulo: 'Computador não liga',
      descricao: 'Cliente informou que o computador não inicia.',
      cliente: 'Empresa Alpha',
      tecnicoResponsavel: 'Kalvim Dias',
      dataAbertura: DateTime(2026, 6, 1),
      status: StatusChamado.novo,
    ),

    Chamado(
      id: 2,
      titulo: 'Impressora Epson',
      descricao: 'Falha de comunicação USB.',

      cliente: 'Empresa Alpha',
      tecnicoResponsavel: 'Kalvim Dias',
      dataAbertura: DateTime(2026, 6, 1),
      status: StatusChamado.emAtendimento,
    ),

    Chamado(
      id: 3,
      titulo: 'Internet instável',
      descricao: 'Cliente deve testar por mais 24h.',
      cliente: 'Empresa Alpha',
      tecnicoResponsavel: 'Kalvim Dias',
      dataAbertura: DateTime(2026, 6, 1),
      status: StatusChamado.aguardandoCliente,
    ),

    Chamado(
      id: 4,
      titulo: 'Troca de SSD',
      descricao: 'Serviço concluído.',
      cliente: 'Empresa Alpha',
      tecnicoResponsavel: 'Kalvim Dias',
      dataAbertura: DateTime(2026, 6, 1),
      status: StatusChamado.finalizado,
    ),

    Chamado(
      id: 5,
      titulo: 'Configuração de rede',
      descricao: 'Aguardando técnico assumir.',
      cliente: 'Empresa Alpha',
      tecnicoResponsavel: 'Kalvim Dias',
      dataAbertura: DateTime(2026, 6, 1),
      status: StatusChamado.novo,
    ),
  ];

  int get novos => chamados.where((c) => c.status == StatusChamado.novo).length;

  int get emAtendimento =>
      chamados.where((c) => c.status == StatusChamado.emAtendimento).length;

  int get aguardandoCliente =>
      chamados.where((c) => c.status == StatusChamado.aguardandoCliente).length;

  int get finalizados =>
      chamados.where((c) => c.status == StatusChamado.finalizado).length;

  List<Chamado> obterPorStatus(StatusChamado status) {
    return chamados.where((c) => c.status == status).toList();
  }

  Chamado? obterPorId(int id) {
    try {
      return chamados.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }
}
