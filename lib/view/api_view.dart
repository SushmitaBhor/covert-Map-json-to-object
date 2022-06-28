import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_handle_response/Model/dataModel.dart';
import 'package:learn_handle_response/state/app_state.dart';
import 'package:learn_handle_response/util/data_util.dart';
import 'package:provider/provider.dart';

class ApiView extends StatelessWidget {
  const ApiView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppState>(builder: (context, provider, child) {
      return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(CupertinoIcons.refresh_thick),
            onPressed: () async {
              List<DataModel> data = await DataUtil().getData();
              provider.updateDataModel(data);
            },
          ),
          body: Container(
            height: size.height -
                const CupertinoNavigationBar().preferredSize.height,
            width: size.width,
            child: provider.dataList.isEmpty
                ? Center(
                  child: const Text('There is no data',style: TextStyle(
              fontSize: 20
            ),),
                )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${provider.dataList[index].title}"),
                      leading:
                      Text(
                          "${provider.dataList[index].id}"),
                      );
                    },
                    itemCount: provider.dataList.length,
                  ),
          ));
    });
  }
}
