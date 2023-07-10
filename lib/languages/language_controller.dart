import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_app/pref_service.dart';

class LanguageController extends GetxController {
  final PrefService _prefService = PrefService();

  var savedLang = 'fr'.obs;

  saveLocale() {
    _prefService.createString('locale', savedLang.value);
  }

  Future<void> setLocale() async {
    _prefService.readString('locale').then((value) {
      if (value != null && value.isNotEmpty) {
        Get.updateLocale(Locale(value.toString().toLowerCase()));
        savedLang.value = value.toString();
      }
    });
  }

  @override
  void onInit() {
    setLocale();
    super.onInit();
  }
}
