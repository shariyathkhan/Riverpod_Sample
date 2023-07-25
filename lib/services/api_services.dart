import 'dart:convert';
import 'package:flutter_ar/configs/app_configs.dart';
import 'package:flutter_ar/features/dashboard/persentation/providers/state/dashboard_model.dart';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/connectivity/network_services.dart';

class ApiService {
  String userUrl = AppConfigs.baseUrl;

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final userProvider = Provider<ApiService>((ref) => ApiService());
