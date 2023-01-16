import 'package:flipr/controller/controllers_export.dart';
import 'package:flipr/model/nse_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CompanyView extends GetView<CompanyController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: true,
        title: Text(
          "Stock Details",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              width: 150,
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
                    items: controller.stockName
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text("${value}"));
                    }).toList(),
                    onChanged: (String? value) {
                      controller.dropDownValue.value = value!;
                      controller.getStockData(value, "1", "365");
                    }),
              ),
            ),
            Obx(
              () => Container(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  controller.dropDownValue.value,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
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
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "high",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      controller.nseModelList.isEmpty
                          ? "0"
                          : controller.nseModelList.last!.high!
                              .toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "NSE",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "ADVANCE CHART",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
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
                    interval: 50,
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
                      xValueMapper: (NseModel? model, _) {
                        if (controller.graphType.value == GraphType.oneDay) {
                          return model?.dated;
                        } else if (controller.graphType.value ==
                            GraphType.oneMonth) {
                          return model?.dated;
                        } else if (controller.graphType.value ==
                            GraphType.oneYear) {
                          return model?.dated;
                        }
                      },
                      yValueMapper: (NseModel? model, _) => model?.high,
                      markerSettings: MarkerSettings(
                          isVisible: false,
                          borderColor: Colors.black,
                          borderWidth: 1),
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.grey.withOpacity(0.3),
                        ],
                        stops: <double>[
                          0,
                          0.7,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderWidth: 2,
                      borderColor: Colors.black,
                      dataLabelMapper: (NseModel? data, int index) {
                        return "";
                      },
                      dataLabelSettings: DataLabelSettings(
                        color: Colors.black,
                        isVisible: true,
                      ),
                      splineType: SplineType.natural,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => Row(
                children: [
                  TextButton(
                      onPressed: () {
                        controller.graphType.value = GraphType.oneDay;
                        controller.graphType.update((_) {});
                        controller.getStockData(
                            controller.dropDownValue.value, "1", "120");
                        controller.buttonColors.value = [true, false, false];
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: controller.buttonColors.value[0]
                              ? Colors.grey
                              : Colors.white),
                      child: Text(
                        "1d",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        controller.graphType.value = GraphType.oneMonth;
                        controller.graphType.update((_) {});
                        controller.getStockData(
                            controller.dropDownValue.value, "1", "700");
                        controller.buttonColors.value = [false, true, false];
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: controller.buttonColors.value[1]
                              ? Colors.grey
                              : Colors.white),
                      child: Text(
                        "1m",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        controller.graphType.value = GraphType.oneYear;
                        controller.graphType.update((_) {});
                        controller.getStockData(
                            controller.dropDownValue.value, "1", "");
                        controller.buttonColors.value = [false, false, true];
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: controller.buttonColors.value[2]
                              ? Colors.grey
                              : Colors.white),
                      child: Text(
                        "1y",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
