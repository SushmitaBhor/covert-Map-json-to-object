import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/user_model.dart';

class UserRepo{
  Future<List<UserModel>> getUser()async{
    List<UserModel> list=[];
    try{

     var request= http.Request("GET",Uri.parse("https://reqres.in/api/users?page=2"));
    http.StreamedResponse response= await request.send();
    if(response.statusCode==200){
      var rowData= await response.stream.bytesToString();
      var data=json.decode(rowData);
      for(var e in data["data"]){
          UserModel model=UserModel.fromJson(e);
          list.add(model);
      }
      return list;
    }
    else{
      print(response.reasonPhrase);
      return list;
    }
    }
    catch(e){
      print("Exception $e");
      throw e;
    }
  }
}