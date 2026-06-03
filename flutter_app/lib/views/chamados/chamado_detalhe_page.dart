import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/dashboard_provider.dart';

class ChamadoDetalhePage extends ConsumerWidget {
  final int chamadoId;

  const ChamadoDetalhePage({super.key, required this.chamadoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dashboardProvider);

    final chamado = viewModel.obterPorId(chamadoId);

    if (chamado == null) {
      return const Scaffold(
        body: Center(child: Text('Chamado não encontrado')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Chamado')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${chamado.id}'),

            const SizedBox(height: 16),

            Text(
              'Título: ${chamado.titulo}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            Text('Cliente: ${chamado.cliente}'),

            Text('Técnico: ${chamado.tecnicoResponsavel}'),

            Text(
              'Data: ${chamado.dataAbertura.day}/'
              '${chamado.dataAbertura.month}/'
              '${chamado.dataAbertura.year}',
            ),

            const SizedBox(height: 16),

            Text('Descrição: ${chamado.descricao}'),

            const SizedBox(height: 16),

            Text('Status: ${chamado.status.name}'),
          ],
        ),
      ),
    );
  }
}
