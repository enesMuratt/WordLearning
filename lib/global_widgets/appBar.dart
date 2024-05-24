


import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar appbar(context,{required Widget ?left,required Widget ?center,Widget ?right,Function ?leftButton} ){
  return AppBar(
    automaticallyImplyLeading: false,

    title:  Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
          //  width: MediaQuery.of(context).size.width/0.20,
            alignment: Alignment.centerLeft,
            child:InkWell(
              child: left,
              onTap: ()=>leftButton,
            ),
          ),
          Container(
           //width: MediaQuery.of(context).size.width/0.50,
            alignment: Alignment.center,
            child: center,
          ),
          Container(
          //  width: MediaQuery.of(context).size.width/0.20,
            alignment: Alignment.centerRight,
            child: right,
          ),
        ],
      ),
    ),

  );}