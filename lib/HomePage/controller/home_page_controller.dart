import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_swire/HomePage/model/home_page_model.dart';
import 'package:http/http.dart' as http;

class HomePageController extends ChangeNotifier {
  HomePageController();

  Future<List<HomePageModel>> getHttpData() async {
    List<HomePageModel> list = [];

    try {
      final response = await http.get(Uri.parse('https://remoteok.io/api'));
      if (response.statusCode == HttpStatus.ok) {
        list = List<HomePageModel>.from(
            json.decode(response.body).map((e) => HomePageModel.fromJson(e)));
        notifyListeners();
      } else {
        throw Exception();
      }
    } catch (e) {
      print('Error occrued!');
    }

    return list;
  }
}
