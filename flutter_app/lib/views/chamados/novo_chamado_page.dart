import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/chamados_provider.dart';

class NovoChamadoPage extends ConsumerStatefulWidget {
  const NovoChamadoPage({super.key});

  @override
  ConsumerState<NovoChamadoPage> createState() => _NovoChamadoPageState();
}

class _NovoChamadoPageState extends ConsumerState<NovoChamadoPage> {
  final tituloController = TextEditingController();

  final descricaoController = TextEditingController();

  final clienteController = TextEditingController();

  @override
  void dispose() {
    tituloController.dispose();
    descricaoController.dispose();
    clienteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Novo Chamado')),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: tituloController,
              decoration: const InputDecoration(labelText: 'Título'),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: clienteController,
              decoration: const InputDecoration(labelText: 'Cliente'),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                ref
                    .read(chamadosProvider.notifier)
                    .adicionarChamado(
                      titulo: tituloController.text,
                      descricao: descricaoController.text,
                      cliente: clienteController.text,
                    );

                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
