import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flipr/model/model_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  List<String> stockExchange = <String>['NSE', 'BSE'];
  Rx<String> dropDownValue = "NSE".obs;
  final nseModelList = <NseModel?>[].obs;
  final dio.Dio _dio = dio.Dio();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getStockData("NSE");
    super.onInit();
  }

  @override
  void onClose() {
    Hive.close();
    super.onClose();
  }

  Future<List<NseModel?>?> getStockData(String stockInfo) async {
    try {
      dio.Response response =
          await _dio.get("http://165.232.182.158/data/$stockInfo");
      if (response.statusCode == 200) {
        nseModelList.value = nseModelFromJson(json.encode(response.data))!;
      }
      return nseModelFromJson(json.encode(response.data));
    } catch (error) {
      Get.showSnackbar(const GetSnackBar(
        title: "Error while Data",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
      ));
      return [];
    }
  }
}
