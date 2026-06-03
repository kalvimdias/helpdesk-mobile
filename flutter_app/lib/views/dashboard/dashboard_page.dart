import 'package:flutter/material.dart';

import '../../widgets/dashboard_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DashboardCard(
              titulo: 'Novos Chamados',
              quantidade: 12,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Em Atendimento',
              quantidade: 8,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            DashboardCard(
              titulo: 'Aguardando Cliente',
              quantidade: 5,
              onTap: () {},
            ),

            const SizedBox(height: 12),

            DashboardCard(titulo: 'Finalizados', quantidade: 31, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
