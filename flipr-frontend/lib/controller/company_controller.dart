import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/model_export.dart';

enum GraphType { oneDay, oneMonth, oneYear }

class CompanyController extends GetxController {
  List<String> stockName = <String>[
    'AshokLeyLand',
    'Cipla',
    'TataSteel',
    'EicherMotors',
    'Reliance',
  ];
  Rx<String> dropDownValue = "AshokLeyLand".obs;
  Rx<GraphType> graphType = GraphType.oneYear.obs;
  final nseModelList = <NseModel?>[].obs;
  Rx<NseModel> graphModel = NseModel().obs;
  final dio.Dio _dio = dio.Dio();
  final ScrollController scrollController = ScrollController();
  final buttonColors = [false, false, true].obs;

  @override
  void onInit() {
    getStockData("AshokLeyLand", "1", "");
    super.onInit();
  }

  Future<List<NseModel?>?> getStockData(
      String stockInfo, String page, String limit) async {
    try {
      dio.Response response = await _dio.get(
          "http://165.232.182.158/data/$stockInfo/?page=$page&limit=$limit");
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

  String? xMapperOfChart(NseModel? mappData) {
    if (graphType == GraphType.oneYear) {
      return graphModel.value.dated?.year.toString();
    } else if (graphType == GraphType.oneMonth) {
      return graphModel.value.dated?.month.toString();
    } else if (graphType == GraphType.oneDay) {
      return graphModel.value.dated?.day.toString();
    }
  }
}
