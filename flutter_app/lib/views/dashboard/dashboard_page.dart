import 'package:flutter/material.dart';

import '../../widgets/dashboard_card.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodels/dashboard_provider.dart';

import 'package:go_router/go_router.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(dashboardProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DashboardCard(
              titulo: 'Novos Chamados',
              quantidade: viewModel.novos,
              onTap: () {
                context.go('/chamados/novo');
              },
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Em Atendimento',
              quantidade: viewModel.emAtendimento,
              onTap: () {
                context.go('/chamados/emAtendimento');
              },
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Aguardando Cliente',
              quantidade: viewModel.aguardandoCliente,
              onTap: () {
                context.go('/chamados/aguardandoCliente');
              },
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Finalizados',
              quantidade: viewModel.finalizados,
              onTap: () {
                context.go('/chamados/finalizado');
              },
            ),
          ],
        ),
      ),
    );
  }
}
