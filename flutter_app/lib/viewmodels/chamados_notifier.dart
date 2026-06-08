import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/chamado.dart';

class ChamadosNotifier extends Notifier<List<Chamado>> {
  @override
  List<Chamado> build() {
    return [
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
        cliente: 'Empresa Beta',
        tecnicoResponsavel: 'Kalvim Dias',
        dataAbertura: DateTime(2026, 6, 2),
        status: StatusChamado.emAtendimento,
      ),

      Chamado(
        id: 3,
        titulo: 'Internet instável',
        descricao: 'Cliente deve testar por mais 24h.',
        cliente: 'Empresa Gamma',
        tecnicoResponsavel: 'Kalvim Dias',
        dataAbertura: DateTime(2026, 6, 3),
        status: StatusChamado.aguardandoCliente,
      ),

      Chamado(
        id: 4,
        titulo: 'Troca de SSD',
        descricao: 'Serviço concluído.',
        cliente: 'Empresa Delta',
        tecnicoResponsavel: 'Kalvim Dias',
        dataAbertura: DateTime(2026, 6, 4),
        status: StatusChamado.finalizado,
      ),

      Chamado(
        id: 5,
        titulo: 'Configuração de rede',
        descricao: 'Aguardando técnico assumir.',
        cliente: 'Empresa Omega',
        tecnicoResponsavel: 'Kalvim Dias',
        dataAbertura: DateTime(2026, 6, 5),
        status: StatusChamado.novo,
      ),
    ];
  }

  int get novos => state.where((c) => c.status == StatusChamado.novo).length;

  int get emAtendimento =>
      state.where((c) => c.status == StatusChamado.emAtendimento).length;

  int get aguardandoCliente =>
      state.where((c) => c.status == StatusChamado.aguardandoCliente).length;

  int get finalizados =>
      state.where((c) => c.status == StatusChamado.finalizado).length;

  List<Chamado> obterPorStatus(StatusChamado status) {
    return state.where((c) => c.status == status).toList();
  }

  Chamado? obterPorId(int id) {
    try {
      return state.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }

  void adicionarChamado({
    required String titulo,
    required String descricao,
    required String cliente,
  }) {
    final novoId = state.isEmpty
        ? 1
        : state.map((c) => c.id).reduce((a, b) => a > b ? a : b) + 1;

    final chamado = Chamado(
      id: novoId,
      titulo: titulo,
      descricao: descricao,
      cliente: cliente,
      tecnicoResponsavel: 'Não atribuído',
      dataAbertura: DateTime.now(),
      status: StatusChamado.novo,
    );

    state = [...state, chamado];
  }

  void alterarStatus(int chamadoId, StatusChamado novoStatus) {
    state = state.map((chamado) {
      if (chamado.id == chamadoId) {
        return Chamado(
          id: chamado.id,
          titulo: chamado.titulo,
          descricao: chamado.descricao,
          cliente: chamado.cliente,
          tecnicoResponsavel: chamado.tecnicoResponsavel,
          dataAbertura: chamado.dataAbertura,
          status: novoStatus,
        );
      }

      return chamado;
    }).toList();
  }

  void excluirChamado(int chamadoId) {
    state = state.where((c) => c.id != chamadoId).toList();
  }
}
