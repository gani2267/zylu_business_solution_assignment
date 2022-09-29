import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zylu_business_solution_assignment/firebase_ref/references.dart';
import 'package:zylu_business_solution_assignment/models/employers_model.dart';

import '../firebase_ref/loading_status.dart';

class DataUploader extends GetxController {

  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading; //0

    final firestore = FirebaseFirestore.instance;
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // load json file and print path
    final employeesInAssets = manifestMap.keys.where((path) =>
    path.startsWith("assets/DB") && path.contains(".json")).toList();
    // print("log : ");
    // print(employees);

    List<EmployersModel>? employers = [];
    //
    for (var employerInfo in employeesInAssets) {
      // print(employerInfo);
      String employerInfoContent = await rootBundle.loadString(employerInfo);
      Iterable list = json.decode(employerInfoContent);
      // print(list.length);
      employers = (list.map((e) => EmployersModel.fromJson(e))).toList();
      // employers?.add(EmployersModel.fromJson(json.decode(employerInfoContent)));
    }
    print(employers);
    var batch = firestore.batch();
    //
    for (var employ in employers!) {
      batch.set(employeeRF.doc(employ.name), {
        "name": employ.name,
        "state": employ.state,
        "is_active": employ.isActive,
        "exp_yrs": employ.exp,
      });
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }

}
