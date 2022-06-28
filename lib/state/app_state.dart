import 'dart:async';

import 'package:flutter/material.dart';

import '../Model/dataModel.dart';
// this is provider class because it extends changeNotifier
class AppState extends ChangeNotifier{
int temp=10;
void updateTemp(int temp){
  this.temp=temp;
  // to update use notifyListeners();
  notifyListeners();
}


// Timer function advanced provider concept

int start=0;
void updateStart(int start){
  this.start=start;
  notifyListeners();
}

void getTimer(){
  Timer.periodic(Duration(seconds: 1),(timer){
    updateStart(timer.tick);
  });
}

// async is used to get delayed value through Future

// Provider with async

String name="Sushmita";
void updateName(String name){
  this.name=name;
  notifyListeners();
}

Future<void> getName(String name) async{
  Future.delayed(Duration(seconds: 5),(){
    updateName(name);
  });
  }


  //Change the widget

  //update ui

bool change=false;
void updateWidget(){
  this.change=!change;
  notifyListeners();
}

// Rest API using Provider

// Provider working with Rest Api
List<DataModel> dataList=[];
void updateDataModel(List<DataModel> dataList){
  this.dataList=dataList;
  notifyListeners();

}
}