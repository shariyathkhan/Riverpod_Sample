import 'package:flutter_ar/features/dashboard/persentation/providers/state/dashboard_model.dart';
import 'package:flutter_ar/services/api_services.dart';
import 'package:flutter_ar/shared/connectivity/network_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoadingProvider = StateProvider<bool>((ref) {
  return false;
});

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  final response = ref.watch(userProvider).getUsers();

  return response;
});

final filterProvider = StateProvider((_) => '');

// final nameProvider = StateProvider<String>(
//     (ref) => ref.watch(userDataProvider.select((user) => user)));


