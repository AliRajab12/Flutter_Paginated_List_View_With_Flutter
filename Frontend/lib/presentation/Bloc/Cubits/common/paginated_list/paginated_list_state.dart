import 'package:equatable/equatable.dart';
import 'package:flutter_with_painated_list_view/domain/entity/store.dart';

abstract class PaginatedListState extends Equatable {
  const PaginatedListState();
}

class PaginatedListInitialState extends PaginatedListState {
  @override
  List<Object> get props => [];
}

class PaginatedListDataLoadedState extends PaginatedListState {
  final List<StoreEntity> stores;
  final bool hasReachedEnd;

  const PaginatedListDataLoadedState(this.stores, this.hasReachedEnd);

  @override
  List<Object> get props => [stores, hasReachedEnd];
}

class PaginatedListLoadingState extends PaginatedListState {
  const PaginatedListLoadingState();

  @override
  List<Object> get props => [];
}

class PaginatedListErrorState extends PaginatedListState {
  final String error;

  const PaginatedListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
