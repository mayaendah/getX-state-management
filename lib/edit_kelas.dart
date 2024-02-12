import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnilaiawal/home_Controller.dart';
import 'package:getxnilaiawal/home_view.dart';

class EditKelas extends StatelessWidget {
  const EditKelas({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController=Get.find();
    return GestureDetector(
      onTap: (){
        ()=>FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // color: Colors.green
            ),
            child: TextField(
              controller: homeController.editKelas,
              onSubmitted: (value){
                Get.defaultDialog(
                  title: "EditKelas",
                  middleText: "Yakin Edit Nama Kelas?",
                  onConfirm: (){
                    homeController.updateKelasName(homeController.editKelas.text);
                    Get.to(HomeView());
                    Get.snackbar('Kelas','Nama Kelas baru saja di perbaharui',
                      duration: Duration(seconds: 3)
                    );
                  },
                  onCancel: (){
                    Get.back();
                  }
                );

              },
              decoration: InputDecoration(
                label: Text('Input Nama Kelas'),
                  border: OutlineInputBorder(),
                hintText: "Input Nama Kelas"
              ),
            ),
          ),
        ),
      ),
    );
  }
}
