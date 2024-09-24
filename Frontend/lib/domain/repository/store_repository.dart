import 'package:flutter_with_painated_list_view/domain/entity/store.dart';

abstract class StoreRepoistory {
  Future<List<StoreEntity>> fetchStores({required int offset, int limit});
}
