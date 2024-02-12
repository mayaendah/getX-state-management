import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxnilaiawal/home_Controller.dart';

class TambahMatpel extends StatelessWidget {
  const TambahMatpel({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    FocusNode focusNode = FocusNode();
    return Scaffold(
      appBar: AppBar(
        title: Text('RxMap'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              onEditingComplete: (() => focusNode.requestFocus()),
              controller: homeController.Addkey,
              decoration: InputDecoration(label: Text('input key')),
            ),
            TextField(
              focusNode: focusNode,
              controller: homeController.AddValue,
              decoration: InputDecoration(label: Text('input value')),
            ),
            ElevatedButton(
                onPressed: () {
                  homeController.addMatpel(
                      homeController.Addkey.text, homeController.AddValue.text);
                },
                child: Text('Submit')),
            Obx(()=>ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeController.listMatpel.length,
                  itemBuilder: (contex, index) {
                    MapEntry listMatpelEntry= homeController.listMatpel.entries.elementAt(index);
                    return  Column(
                        children: [
                          Text(listMatpelEntry.key),
                          Text(listMatpelEntry.value),
                        ],

                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
