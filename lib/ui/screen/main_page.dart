import 'package:flutter/material.dart';
import 'package:mask/ui/widget/remain_stat_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:mask/viewmodel/store_model.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final storeModel = Provider.of<StoreModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('마스크 재고 있는 곳 : ${storeModel.stores.length}곳'),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  storeModel.fetch();
                })
          ],
        ),
        body: storeModel.isLoading
            ? loadingWidget()
            : ListView(
                children: storeModel.stores.map((element) {
                return ListTile(
                  title: Text(element.name!),
                  subtitle: Text(element.addr!),
                  trailing: RemainStatListTile(element),
                );
              }).toList()));
  }

  Widget loadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('정보를 가져오는 중'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
