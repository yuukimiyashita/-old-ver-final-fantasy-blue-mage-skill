import 'dart:convert';
import 'dart:developer';

import 'package:apifinalfantasy/models/final_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  int x = 1;
  Future<List<FinalApi>> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://ffxivcollect.com/api/spells/$x');
    var response = await client.get(uri);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        final data = FinalApi.fromMap(jsonDecode(json));
        //trocar para fromJson caso usando Json
        return [data];
      }
    } catch (e) {
      log(e.toString());
    }

    return [];
  }
}
