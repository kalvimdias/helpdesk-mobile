import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/chamado.dart';
import '../../viewmodels/dashboard_provider.dart';

import 'package:go_router/go_router.dart';

class ChamadosPage extends ConsumerWidget {
  final StatusChamado status;

  const ChamadosPage({super.key, required this.status});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dashboardProvider);

    final chamados = viewModel.obterPorStatus(status);

    return Scaffold(
      appBar: AppBar(title: Text(_tituloStatus())),
      body: ListView.builder(
        itemCount: chamados.length,
        itemBuilder: (context, index) {
          final chamado = chamados[index];

          return ListTile(
            title: Text(chamado.titulo),
            subtitle: Text(chamado.cliente),
            leading: CircleAvatar(child: Text(chamado.id.toString())),
            onTap: () {
              context.push('/chamado/${chamado.id}');
            },
          );
        },
      ),
    );
  }

  String _tituloStatus() {
    switch (status) {
      case StatusChamado.novo:
        return 'Novos Chamados';

      case StatusChamado.emAtendimento:
        return 'Em Atendimento';

      case StatusChamado.aguardandoCliente:
        return 'Aguardando Cliente';

      case StatusChamado.finalizado:
        return 'Finalizados';
    }
  }
}
