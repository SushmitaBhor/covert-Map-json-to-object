import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_handle_response/Model/user_model.dart';
import 'package:learn_handle_response/Widget/first_page.dart';
import 'package:learn_handle_response/Widget/second_page.dart';
import 'package:learn_handle_response/repository/user_repo.dart';
import 'package:learn_handle_response/state/app_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserModel> list=[];
//Create instance of Provider
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    var appProvider=Provider.of<AppState>(context,listen: false);
    //1st way
    //<className> is used to identify provider to be use
    // instant fetch value from provider requires call event i.e. onTap, on DoubleTap or listener otherwise we need to auto restart in order fetch value

    //2nd way
    // suppose we don't want Provider for entire app
    // Consumer initiates Provider for particular widget
    // to tell type of provider <classname of provider>
    // AppState provider = Provider.of<AppState>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(

        child: Icon(CupertinoIcons.cloud_download),
        onPressed: ()async{
          // appProvider.updateWidget();
        List<UserModel> lists=await  UserRepo().getUser();
        setState(() {
          list=lists;
        });
        // print("Data ${lists.first.firstName}");
        },

        backgroundColor: Colors.blueGrey,

      ),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text("Flutter Provider Tutorial"),
        ),
        body:Container(
          height: size.height - const CupertinoNavigationBar().preferredSize.height,
          width: size.width,
          child: ListView.builder(itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index].firstName),
              subtitle: Text(list[index].email),
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(list[index].avatar),
              ),
            );
          },itemCount: list.length,)),
        );
  }
}
