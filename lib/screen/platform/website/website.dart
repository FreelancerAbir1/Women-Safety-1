import 'package:flutter/material.dart';

 import 'component/add product/add_product.dart';
import 'component/login/login_admin.dart';

class WebsitePlatform extends StatelessWidget {
  const WebsitePlatform({super.key});

  @override
  Widget build(BuildContext context) {
    // return const AdminSideScreen();
    return   const AddProduct();
  }
}
