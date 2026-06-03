import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dashboard_viewmodel.dart';

final dashboardProvider = Provider<DashboardViewModel>(
  (ref) => DashboardViewModel(),
);
