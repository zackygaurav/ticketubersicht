import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ticketubersicht_task/list_data_model.dart';

Future<List<ListDataModel>> gatherJsonData() async {
  final jsonData = await rootBundle.loadString('assets/json/data.json');
  final list = json.decode(jsonData) as List<dynamic>;

  return list.map((e) => ListDataModel.fromJson(e)).toList();
}
