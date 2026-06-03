import 'package:go_router/go_router.dart';
import '../views/login/login_page.dart';
import '../views/dashboard/dashboard_page.dart';

import '../models/chamado.dart';
import '../views/chamados/chamados_page.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/chamados/:status',
      builder: (context, state) {
        final statusParam = state.pathParameters['status']!;

        StatusChamado status;

        switch (statusParam) {
          case 'novo':
            status = StatusChamado.novo;
            break;

          case 'emAtendimento':
            status = StatusChamado.emAtendimento;
            break;

          case 'aguardandoCliente':
            status = StatusChamado.aguardandoCliente;
            break;

          default:
            status = StatusChamado.finalizado;
        }

        return ChamadosPage(status: status);
      },
    ),
  ],
);
