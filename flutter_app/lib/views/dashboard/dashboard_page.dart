import 'package:flutter/material.dart';

import '../../widgets/dashboard_card.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/chamados_provider.dart';

import 'package:go_router/go_router.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(chamadosProvider);
    final viewModel = ref.read(chamadosProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/novo-chamado');
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DashboardCard(
              titulo: 'Novos Chamados',
              quantidade: viewModel.novos,
              icone: Icons.fiber_new,
              onTap: () {
                context.push('/chamados/novo');
              },
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Em Atendimento',
              quantidade: viewModel.emAtendimento,
              icone: Icons.fiber_new,
              onTap: () {
                context.push('/chamados/emAtendimento');
              },
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Aguardando Cliente',
              quantidade: viewModel.aguardandoCliente,
              icone: Icons.fiber_new,
              onTap: () {
                context.push('/chamados/aguardandoCliente');
              },
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Finalizados',
              quantidade: viewModel.finalizados,
              icone: Icons.fiber_new,
              onTap: () {
                context.push('/chamados/finalizado');
              },
            ),
          ],
        ),
      ),
    );
  }
}
