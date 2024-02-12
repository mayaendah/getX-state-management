import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnilaiawal/tambah_matpel.dart';
import 'package:getxnilaiawal/tambah_nama_siswa.dart';

import 'edit_kelas.dart';
import 'home_Controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Nilai awal Getx'),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.bottomSheet(
                      SafeArea(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xFFFDD9D9),
                              borderRadius: BorderRadius.circular(10)),
                          height:  120,
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.to(EditKelas());
                                  },
                                  child: Text(
                                    'Edit Kelas',
                                    style: TextStyle(color: Color(0xFF500505)),
                                  )),
                              Divider(thickness: 0.5, color: Color(0xFFE59292)),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    Get.to(TambahNamaSiswa());
                                  },
                                  child: Text('Tambah Nama Siswa')),
                              Divider(thickness: 0.5, color: Color(0xFFE59292)),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                    Get.to(TambahMatpel());
                                  },
                                  child: Text('Tamabah Matpel')),
                            ],
                          ),
                        ),
                      ),
                      // barrierColor: Colors.red[50],
                      // isDismissible: true,
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(35),
                      //     side: BorderSide(
                      //         width: 1,
                      //         color: Colors.black
                      //     )
                      // ),
                      // enableDrag: true,
                    );
                  },
                  icon: Icon(Icons.edit_note_outlined))
            ],
          ),
          body: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(
                      child: Obx(
                        () => Text(
                          homeController.newNmKelas.value,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0x9DCDD75E)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Obx(() => Text(
                              'Jumlah Siswa : ${homeController.count.value}')),
                          Expanded(child: Container()),
                          IconButton(
                            onPressed: () {
                              homeController.TambahSiswa();
                            },
                            icon: Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () {
                              homeController.KurangiSiswa();
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Obx(() => Text(
                                "${homeController.isOpen.value ? 'Open' : 'Closed'}",
                                style: TextStyle(
                                    color: homeController.isOpen.value
                                        ? Colors.green
                                        : Colors.red),
                              )),
                          Expanded(
                            child: Container(),
                            flex: 1,
                          ),
                          Obx(
                            () => Switch(
                                value: homeController.isOpen.value,
                                activeColor: Colors.purple,
                                onChanged: (value) =>
                                    {homeController.setIsOpen(value)}),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Nama siswa',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xC5B7B7FF),
                  child: Obx(
                    () => ListView.builder(
                        shrinkWrap: true,
                        itemCount: homeController.SiswaName.length,
                        itemBuilder: (context, index) {
                          return Text(
                              '${homeController.SiswaName.value[index]}');
                        }),
                  ),
                )),
                Container(
                    width: double.infinity,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Daftar Matapelajaran',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xC791FFC2),
                  child: Obx(()=>ListView.builder(
                      shrinkWrap: true,
                      itemCount: homeController.listMatpel.length,
                      itemBuilder: (context, index) {
                        MapEntry listMatpelEntry= homeController.listMatpel.entries.elementAt(index);
                        return ListTile(
                          title: Text(listMatpelEntry.key),
                          trailing: Text(listMatpelEntry.value),
                        );
                      }),
                  )
                ))
              ],
            ),
          )),
    );
  }
}
