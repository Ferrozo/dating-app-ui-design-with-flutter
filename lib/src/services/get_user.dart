import 'dart:convert';

import 'package:dating_app_ui_design_with_flutter/src/model/user_model.dart';
import 'package:flutter/services.dart';

class GetUser {
  Future readJsonFile() async {
    final String response =
        await rootBundle.loadString('assets/data/users-data.json');

    final data = json.decode(response);
    return data.map((e) => UserModel.fromJson(e)).toList();
  }
}
