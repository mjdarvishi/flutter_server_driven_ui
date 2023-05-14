
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
typedef BtnAction = FutureOr Function();

class Button extends StatefulWidget {

  final  BtnAction change;
  String title;
  Color color;
  TextStyle? textStyle;
  EdgeInsets ?padding;
  EdgeInsets ?margin;
  Border ?border;
  final double radios;
  @override
  _ButtonState createState() => _ButtonState();

  Button({this.radios= 10,required this.change,required this.title,required this.color,this.textStyle,this.padding,this.border,this.margin});
}

class _ButtonState extends State<Button> {
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: widget.margin??const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: double.infinity,
      child: GestureDetector(
        onTap:()async {
         try{
           FocusManager.instance.primaryFocus?.unfocus();
           if(!loading) {
             setState(()=>loading=true);
             await widget.change();
             setState(()=>loading=false);
           }
         }catch(err){
           setState(()=>loading=false);
           rethrow;
         }
        },
        child: Container(
          alignment: Alignment.center,
          padding: widget.padding??const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radios),
              border: widget.border,
              color: widget.color),
          child: animationChild(context),
        ),
      ),
    );
  }

  Widget animationChild(BuildContext context){
    if (!loading) {
      return  Text(widget.title,
          style: widget.textStyle??context.textTheme.titleLarge!.copyWith(fontSize: 19));
    } else{
      return const SizedBox(
        height: 23,
        width: 23,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      );
    }
  }
}
