import 'dart:convert';

import 'package:flutter_with_painated_list_view/config/constants.dart';
import 'package:flutter_with_painated_list_view/data/models/store.dart';
import 'package:http/http.dart' as http;

abstract class StoreRemoteDataSource {
  Future<List<StoreModel>> fetchStores({required int offset, int limit = 15});
}

class StoreRemoteDataSourceImpl extends StoreRemoteDataSource {
  StoreRemoteDataSourceImpl();
  @override
  Future<List<StoreModel>> fetchStores(
      {required int offset, int limit = 10}) async {
    final response = await http
        .get(Uri.parse("$fetchStoresApi?offset=$offset&limit=$limit"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final result = List<StoreModel>.from(
          jsonData["stores"].map((store) => StoreModel.fromMap(store)));
      return result;
    }

    throw Exception();
  }
}
