import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnilaiawal/home_Controller.dart';

class TambahNamaSiswa extends StatelessWidget {
  const TambahNamaSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController=Get.find();
    FocusNode focusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah nama siswa'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              onEditingComplete: (()=>focusNode.requestFocus()),
              controller: homeController.AddNamaSiswa,
              onSubmitted: (value){
                homeController.addSiswa(homeController.AddNamaSiswa.text);
              },
              decoration: InputDecoration(
                  label: Text('Input nama siswa')
              ),
            ),
            SizedBox(height: 10,),
            Obx(()=>
               ListView.builder(
                shrinkWrap: true,
                itemCount: homeController.SiswaName.length,
                  itemBuilder: (context,index){
                return Text(homeController.SiswaName.value[index]);
              }),
            )
          ],
        ),
      ),
    );
  }
}
