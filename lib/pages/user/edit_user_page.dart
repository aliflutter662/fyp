import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_fyp/pages/controllers/data_controller.dart';

class EditUser extends StatefulWidget {
  const EditUser({Key? key}) : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final DataController controller = Get.find();
  final editPriceValue = TextEditingController();
  final editname = TextEditingController();

  editProduct(productID, produtPrice, productname) {
    editPriceValue.text = produtPrice.toString();
    editname.text = productname.toString();
    Get.bottomSheet(
      ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Container(
          color: Colors.white,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Enter email"),
                  controller: editPriceValue,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(labelText: "Enter user name"),
                  controller: editname,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    controller.editProduct(
                        productID, editPriceValue.text, editname.text);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: editProduct() ,
        );
  }
}
