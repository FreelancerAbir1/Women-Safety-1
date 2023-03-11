import 'package:flutter/material.dart';

import 'component/body.dart';

class CreateAccount extends StatelessWidget {

  const CreateAccount({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold( 
           body: SafeArea(child: Body()),
       );
  }
}
