import 'package:flutter/foundation.dart';
import 'package:mask/repository/store_repository.dart';
import 'package:mask/model/store.dart';

class StoreModel with ChangeNotifier {
  final _storeRepository = StoreRepository();
  List<Store> stores = [];
  var isLoading = false;

  StoreModel() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    stores = await _storeRepository.fetch();
    isLoading = false;
    notifyListeners();
  }
}
