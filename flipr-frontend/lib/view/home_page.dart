import 'package:flipr/bindings/bindings_export.dart';
import 'package:flipr/local_storage/local_storage_Export.dart';
import 'package:flipr/model/model_export.dart';
import 'package:flipr/utilities/utilities_export.dart';
import 'package:flipr/view/view_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 10, top: 30),
        color: Colors.grey,
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(LoginPage(), binding: LoginBinding());
            HiveStorage.setLogOut();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            "Logout",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Stock Market Index",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              width: 100,
              child: Obx(
                () => DropdownButton<String>(
                    underline: Container(),
                    alignment: Alignment.bottomCenter,
                    isExpanded: true,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                    value: controller.dropDownValue.value,
                    items: controller.stockExchange
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text("${value}"));
                    }).toList(),
                    onChanged: (String? value) {
                      controller.dropDownValue.value = value!;
                      controller.getStockData(value);
                    }),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                AppStrings.nifty50,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 10,
                child: Container(
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.nseModelList.isEmpty
                          ? "0"
                          : controller.nseModelList.last!.high!
                              .toStringAsFixed(2),
                      style: const TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Day Range",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(controller.nseModelList.isEmpty
                                    ? "0"
                                    : controller.nseModelList.last!.low!
                                        .toStringAsFixed(2)),
                                Text(
                                  "L",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 12),
                                ),
                              ],
                            ),
                            if (controller.nseModelList.value.isNotEmpty)
                              Slider(
                                thumbColor: Colors.black,
                                activeColor: Colors.black26,
                                inactiveColor: Colors.black26,
                                value: controller
                                    .nseModelList.value.last!.adjClose!,
                                onChanged: (_) {},
                                min: controller.nseModelList.value.last!.low!,
                                max: controller.nseModelList.value.last!.high!,
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.nseModelList.isEmpty
                                    ? "0"
                                    : controller.nseModelList.last!.high!
                                        .toStringAsFixed(2)),
                                Text(
                                  "H",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "52 Week Range",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(controller.nseModelList.isEmpty
                                    ? "0"
                                    : controller.nseModelList.first!.low!
                                        .toStringAsFixed(2)),
                                Text(
                                  "L",
                                  style: TextStyle(
                                      color: Colors.redAccent, fontSize: 12),
                                ),
                              ],
                            ),
                            if (controller.nseModelList.value.isNotEmpty)
                              Slider(
                                thumbColor: Colors.black,
                                activeColor: Colors.black26,
                                inactiveColor: Colors.black26,
                                value: controller
                                    .nseModelList.value.last!.adjClose!,
                                onChanged: (_) {},
                                min: controller.nseModelList.value.first!.low!,
                                max: controller.nseModelList.value.last!.high!,
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.nseModelList.isEmpty
                                    ? "0"
                                    : controller.nseModelList.last!.high!
                                        .toStringAsFixed(2)),
                                Text(
                                  "H",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Obx(
                () => SfCartesianChart(
                  title: ChartTitle(text: controller.dropDownValue.value),
                  plotAreaBorderWidth: 2,
                  margin: EdgeInsets.zero,
                  primaryXAxis: DateTimeAxis(
                    title: AxisTitle(text: "Year"),
                    borderColor: Color(0xFF161616),
                    minorGridLines: MinorGridLines(
                      color: Color(0xFF161616),
                      width: 1,
                    ),
                    /*majorGridLines: MajorGridLines(
                      color: Color(0xFF161616),
                      width: 1,
                    ),*/
                    axisLine: AxisLine(
                      color: Color(0xFF161616),
                      width: 1,
                    ),
                    /*majorTickLines: MajorTickLines(
                      width: 0,
                      size: 0,
                    ),*/
                    /*minorTickLines: MinorTickLines(
                      width: 0,
                      size: 0,
                    ),*/
                    labelStyle: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    title: AxisTitle(text: "Value"),
                    borderColor: Color(0xFF161616),
                    labelStyle: TextStyle(
                      fontSize: 0,
                    ),
                    isVisible: true,
                    minorGridLines: MinorGridLines(
                      color: Color(0xFF161616),
                      width: 1,
                    ),
                    /*majorGridLines: MajorGridLines(
                      color: Color(0xFF161616),
                      width: 1,
                    ),*/
                    axisLine: AxisLine(
                      color: Color(0xFF161616),
                      width: 1,
                    ),
                    /* majorTickLines: MajorTickLines(
                      width: 0,
                      size: 0,
                    ),
                    minorTickLines: MinorTickLines(
                      width: 0,
                      size: 0,
                    ),*/
                  ),
                  legend: Legend(isVisible: false),
                  borderWidth: 1,
                  plotAreaBorderColor: Color(0xFF161616),
                  series: <SplineAreaSeries<NseModel?, DateTime?>>[
                    SplineAreaSeries<NseModel?, DateTime?>(
                      // Bind data source
                      dataSource: controller.nseModelList.value,
                      xValueMapper: (NseModel? model, _) => model?.dated,
                      yValueMapper: (NseModel? model, _) => model?.high,
                      markerSettings: MarkerSettings(
                          isVisible: false,
                          borderColor: Colors.green,
                          borderWidth: 1),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.green.withOpacity(0.3),
                        ],
                        stops: <double>[
                          0,
                          0.7,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderWidth: 2,
                      borderColor: Colors.green,
                      dataLabelMapper: (NseModel? data, int index) {
                        return "";
                      },
                      dataLabelSettings: DataLabelSettings(
                        color: Colors.white,
                        isVisible: true,
                      ),
                      splineType: SplineType.natural,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(CompanyView(), binding: CompanyViewBinding());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    "See Stocks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
