import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'chamados_viewmodel.dart';

import 'chamados_notifier.dart';
import '../models/chamado.dart';

final chamadosProvider = NotifierProvider<ChamadosNotifier, List<Chamado>>(
  () => ChamadosNotifier(),
);
