import 'package:firebase_second/app/services/database.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Database? db;

  List docs = [].obs;
  //List data = [].obs;

  initialize() async {
    db = Database();
    db!.initilize();

    await db!.readData().then((value) {
      if (value.isNotEmpty) {
        docs.clear();
        docs.addAll(value);
      }
    }, onError: (err) {
      print(err);
    });
    //print(data);
    print(docs);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  delete(String id) {
    db!.delete(id);
  }
}
