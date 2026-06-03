import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String titulo;
  final int quantidade;
  final VoidCallback onTap;
  final IconData icone;

  const DashboardCard({
    super.key,
    required this.titulo,
    required this.quantidade,
    required this.onTap,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 3,
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icone, size: 32),
              Text(
                titulo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                quantidade.toString(),
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
