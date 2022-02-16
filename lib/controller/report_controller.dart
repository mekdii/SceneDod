import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:scene/model/report.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class ReportController extends GetxController with StateMixin<List<Report>> {
  @override
  void onInit() {
    super.onInit();
    fetchReport();
  }

  List<Report> reports = [];
  fetchReport() async {
    var res = await http.get(Uri.parse('http://192.168.8.102:7000/reports'));
    print(res.statusCode);
    reports = reportFromJson(res.body);
    print('length of reports' + reports.length.toString());
    change(reports, status: RxStatus.success());
    //  Provider().getReport().then((value) => print(value.statusCode));
  }
}
