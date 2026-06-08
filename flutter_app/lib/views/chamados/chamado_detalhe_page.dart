import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/chamados_provider.dart';
import '../../models/chamado.dart';

class ChamadoDetalhePage extends ConsumerWidget {
  final int chamadoId;

  const ChamadoDetalhePage({super.key, required this.chamadoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(chamadosProvider);

    final viewModel = ref.read(chamadosProvider.notifier);

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

            const SizedBox(height: 8),

            Text('Cliente: ${chamado.cliente}'),

            const SizedBox(height: 8),

            Text('Técnico: ${chamado.tecnicoResponsavel}'),

            const SizedBox(height: 8),

            Text(
              'Data: '
              '${chamado.dataAbertura.day}/'
              '${chamado.dataAbertura.month}/'
              '${chamado.dataAbertura.year}',
            ),

            const SizedBox(height: 16),

            Text('Descrição: ${chamado.descricao}'),

            const SizedBox(height: 16),

            Row(
              children: [
                const Text(
                  'Status: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                DropdownButton<StatusChamado>(
                  value: chamado.status,
                  items: StatusChamado.values.map((status) {
                    return DropdownMenuItem(
                      value: status,
                      child: Text(status.name),
                    );
                  }).toList(),
                  onChanged: (novoStatus) {
                    if (novoStatus == null) return;

                    ref
                        .read(chamadosProvider.notifier)
                        .alterarStatus(chamado.id, novoStatus);
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text('Excluir Chamado'),
              onPressed: () async {
                final confirmar = await showDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirmar exclusão'),
                      content: const Text(
                        'Deseja realmente excluir este chamado?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text('Excluir'),
                        ),
                      ],
                    );
                  },
                );

                if (confirmar != true) return;

                ref.read(chamadosProvider.notifier).excluirChamado(chamado.id);

                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
