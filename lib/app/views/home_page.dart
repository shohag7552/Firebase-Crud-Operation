import 'package:firebase_second/app/controllers/home_controller.dart';
import 'package:firebase_second/app/views/add_page.dart';
import 'package:firebase_second/app/views/update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crud operation'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: homeController.docs.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Get.to(UpdatePage(
                      country: homeController.docs[index],
                      db: homeController.db,
                    ))!
                        .then(
                      (value) {
                        homeController.initialize();
                        // Get.find<HomeController>().initialize();
                      },
                    );
                  },
                  title: Text(homeController.docs[index]['name']),
                  subtitle: Text(homeController.docs[index]['code']),
                  trailing: IconButton(
                    onPressed: () {
                      print(homeController.docs[index]['id']);

                      Get.defaultDialog(
                          title: 'Delete Item',
                          middleText: 'Are you sure?',
                          textConfirm: 'Confirm',
                          textCancel: 'Cancle',
                          confirmTextColor: Colors.red,
                          onConfirm: () {
                            homeController
                                .delete(homeController.docs[index]['id']);
                            Get.back();
                          }).then((value) => homeController.initialize());
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[100],
                    ),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddPage())!.then((value) => homeController.initialize());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
