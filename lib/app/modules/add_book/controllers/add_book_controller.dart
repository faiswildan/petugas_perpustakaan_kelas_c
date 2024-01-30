import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:petugas_perpustakaan_kelas_c/app/modules/book/controllers/book_controller.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class AddBookController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController panerbitdController = TextEditingController();
  final BookController bookController = Get.find();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if(status == 'logged'){
      Get.offAllNamed(Routes.Home);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
  login() async {loading(true);
  try{
    FocusScope.of(Get.context!).unfocus();
    formKey.currentState?.save();
    if(formKey.currentState!.validate()){
      final response = await ApiProvider.instance().post(EndPoint.book,
          data: dio.FormData.fromMap(
              {"judul": judulController.text.toString(),
                "kategori": penulisController.text.toString()}));
                "penulis": penerbitController.text.toString()}));
                "penerbit": tahunterbitController.text.toString()}));
      if (response.statusCode == 201) {
        await StorageProvider.write(StorageKey.status, "Buku ditambahkan");
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Sorry", "Buku Gagal Ditambahkan", backgroundColor: Colors.orange);
      }
    }loading(false);
  } on dio.DioException catch (e) {loading(false);
  if (e.response != null) {
    if (e.response?.data != null){
      Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
    }
  } else {
    Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  }
  }catch (e) {loading(false);
  Get.snackbar("Error", e.toString(), backgroundColor: Colors.red)
  }
  }

  void increment() => count.value++;