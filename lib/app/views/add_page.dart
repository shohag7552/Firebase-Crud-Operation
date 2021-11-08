import 'package:firebase_second/app/controllers/add_controller.dart';
import 'package:firebase_second/app/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final AddController addController = Get.put(AddController());
  Database? db;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: TextFormField(
                controller: addController.nameTextController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'country name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.green),
              child: TextFormField(
                controller: addController.codeTextController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'country code',
                  border: InputBorder.none,
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                addController.create();

                // db!.create(addController.nameTextController.text,
                //     addController.codeTextController.text);
                Get.back();
              },
              child: Text('update'),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
