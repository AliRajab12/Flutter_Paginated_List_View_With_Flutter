import 'package:flutter_with_painated_list_view/data/data_sources/remote_data_source.dart';
import 'package:flutter_with_painated_list_view/domain/entity/store.dart';
import 'package:flutter_with_painated_list_view/domain/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepoistory {
  final StoreRemoteDataSource storeDataSource;

  StoreRepositoryImpl({required this.storeDataSource});

  @override
  Future<List<StoreEntity>> fetchStores(
      {required int offset, int limit = 15}) async {
    final stores =
        await storeDataSource.fetchStores(offset: offset, limit: limit);
    return stores;
  }
}
