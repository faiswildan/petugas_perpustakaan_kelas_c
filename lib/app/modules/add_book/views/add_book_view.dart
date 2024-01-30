import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Buku'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: "Masukkan Nama Buku"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Buku tidak boleh kosong";
                  }
                  return null;
                },
              )TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: "Masukkan Kategori Buku"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Kategori tidak boleh kosong";
                  }
                  return null;
                },
              )TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: "Masukkan Nama Penulis"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Nama Penulis tidak boleh kosong";
                  }
                  return null;
                },
              )
              TextFormField(
                controller: controller.penulisController,
                decoration: InputDecoration(hintText: "Masukkan Tahun Terbit"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Tahun Terbit tidak boleh kosong";
                  }
                  return null;
                },
              )
              Obx(() => controller.loading.value? CircularProgressIndicator(): ElevatedButton(onPressed: controller.add(), child: Text("Tambah")))
            ],
          ),
        ),
      ),
    );
  }
}
