// import 'dart:ffi';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  TextEditingController editKelas=TextEditingController();
  TextEditingController AddNamaSiswa=TextEditingController();
  TextEditingController Addkey=TextEditingController();
  TextEditingController AddValue=TextEditingController();

  RxBool isOpen=RxBool(true);
  RxInt count = RxInt(0);
  RxList<String> SiswaName = RxList<String>([]);
  RxMap<String, String> listMatpel = RxMap<String, String>({});
  var newNmKelas='Nama Kelas'.obs;


  void updateKelasName(String value){
    newNmKelas.value=value;
    print(newNmKelas.value);
  }

  void TambahSiswa(){
    count.value++;
  }
  void KurangiSiswa(){
    if(count.value<1){
      Get.snackbar('Total', 'Jumlah siswa tidak boleh nol');
    }else{
      count.value--;
    }

  }
  void setIsOpen(bool open){
    isOpen(open);
  }

  // void SiswaList(List<String> list){
  //   SiswaName.assignAll(list);
  // }

  void addSiswa(String nama){
    SiswaName.add(nama);
    AddNamaSiswa.text='';
    print(SiswaName.value);
  }

  void removeSiswa(int index){
    SiswaName.removeAt(index);
  }


  void addMatpel(String nmMatpel, String jnsMatpel) {
    listMatpel[nmMatpel] = jnsMatpel;
    print(listMatpel.value);
  }

}