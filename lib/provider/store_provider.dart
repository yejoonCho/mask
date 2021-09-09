import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mask/repository/location_repository.dart';
import 'package:mask/repository/store_repository.dart';
import 'package:mask/model/store.dart';

class StoreProvider with ChangeNotifier {
  var isLoading = false;
  List<Store> stores = [];

  final _storeRepository = StoreRepository();
  final _locationRepository = LocationRepository();

  StoreProvider() {
    fetch();
  }

  Future fetch() async {
    isLoading = true;
    notifyListeners();

    Position position = await _locationRepository.getCurrentLocation();

    stores =
        await _storeRepository.fetch(position.latitude, position.longitude);
    isLoading = false;
    notifyListeners();
  }
}
