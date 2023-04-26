import 'dart:convert';

import 'package:flutter/services.dart';

class GetUsers {
  Future<List<dynamic>> getAllUsers() async {
    final String response =
        await rootBundle.loadString('assets/data/users-data.json');
    final data = await json.decode(response);
    return data['users'] as List;
  }
}
