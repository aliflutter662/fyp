import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_fyp/pages/model/product.dart';

class DataController extends GetxController {
  List<product> loginUserData = [];
  List<product> fetchUserData = [];
  final firebaseInstance = FirebaseFirestore.instance;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;

  DataController(String role) {
    userRole = role;
  }

  static String userRoleProperty = "";

  String get userRole {
    return userRoleProperty;
  }

  void set userRole(String userRole) {
    userRoleProperty = userRole;
  }

  Future<void> getLoginUserProduct() async {
    print("loginUserData YEs $loginUserData");
    loginUserData = [];
    try {
      final List<product> lodadedProduct = [];

      //    forEach(
      // (result) {
      //   print(result.data());
      //   print("Products ID  ${result.id}");
      //   lodadedProduct.add(
      //     product(
      //       productId: result.id,
      //       userId: result['user_Id'],
      //       username: result['user_name'],
      //       useremail: result['user_email'],
      //     ),
      //   );
      // });

      var response = await firebaseInstance
          .collection('userlist')
          .where('role', isEqualTo: this.userRole)
          .get();
      // var response1 = await firebaseInstance
      //     .collection('userlist')
      //     .doc(uid)
      //     .collection('userlist')
      //     .snapshots();
      // if (response.docs.length > 0) {
      //   userProfileData['userName'] = response.docs[0]['product_name'];
      //   // userProfileData['joinDate'] = response.docs[0]['joinDate'];
      //   // userProfileData['email'] = response.docs[0]['email'];
      // }
      if (response.docs.length > 0) {
        response.docs.forEach(
          (result) {
            print(result.data());
            print("Products ID  ${result.id}");
            lodadedProduct.add(
              product(
                productId: result.id,
                userId: result['user_Id'],
                username: result['name'],
                useremail: result['email'],
              ),
            );
          },
        );
      }
      loginUserData.addAll(lodadedProduct);
      update();
    } on FirebaseException catch (e) {
      print("Error $e");
    } catch (error) {
      print("error $error");
    }
  }

  // Future editProduct(userId, email, name) async {
  //   print("Product Id  $userId");
  //   try {
  //     await firebaseInstance
  //         .collection("userlist")
  //         .doc(userId)
  //         .update({"user_name": name, "user_email": email}).then((_) {
  //       getLoginUserProduct();
  //     });
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  Future editProduct(productId, price, name) async {
    print("Product Id  $productId");
    try {
      // CommanDialog.showLoading();
      await firebaseInstance
          .collection("userlist")
          .doc(productId)
          .update({"user_email": price, "user_name": name}).then((_) {
        // CommanDialog.hideLoading();
        getLoginUserProduct();
      });
    } catch (error) {
      // CommanDialog.hideLoading();
      // CommanDialog.showErrorDialog();

      print(error);
    }
  }

  Future deleteProduct(String productId) async {
    print("Product Iddd  $productId");
    try {
      await firebaseInstance
          .collection("userlist")
          .doc(productId)
          .delete()
          .then((_) {
        getLoginUserProduct();
      });
    } catch (error) {
      print(error);
    }
  }
}
