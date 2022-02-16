import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:scene/model/announcement.dart';
import 'package:scene/model/report.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class AnnouncementController extends GetxController
    with StateMixin<List<Announcement>> {
  @override
  void onInit() {
    super.onInit();
    fetchReport();
  }

  List<Announcement> reports = [];
  fetchReport() async {
    var res =
        await http.get(Uri.parse('http://192.168.8.102:7000/announcements'));
    print(res.statusCode);
    reports = announcementFromJson(res.body);
    print('length of reports' + reports.length.toString());
    change(reports, status: RxStatus.success());
    //  Provider().getReport().then((value) => print(value.statusCode));
  }
}
