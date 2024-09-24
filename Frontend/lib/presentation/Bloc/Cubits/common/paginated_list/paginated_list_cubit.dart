import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_painated_list_view/domain/repository/store_repository.dart';
import 'paginated_list_state.dart';

class PaginatedListCubit extends Cubit<PaginatedListState> {
  final StoreRepoistory storeRepoistory;
  PaginatedListCubit({required this.storeRepoistory})
      : super(PaginatedListInitialState());

  Future<void> fetchStoresData({required int offset, int limit = 10}) async {
    try {
      if (offset == 1) {
        emit(PaginatedListInitialState());
      } else {
        emit(const PaginatedListLoadingState());
      }
      final storesData =
          await storeRepoistory.fetchStores(offset: offset, limit: limit);
      emit(PaginatedListDataLoadedState(storesData, storesData.isEmpty));
    } catch (e) {
      emit(const PaginatedListErrorState('Failed to fetch data'));
    }
  }
}
