import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_painated_list_view/presentation/Bloc/Cubits/common/paginated_list/paginated_list_cubit.dart';
import 'package:flutter_with_painated_list_view/presentation/Bloc/Cubits/common/paginated_list/paginated_list_state.dart';
import 'package:flutter_with_painated_list_view/presentation/widgets/common/paginated_list_view.dart';
import 'shimmer_list.dart';

class PaginatedListWidget extends StatefulWidget {
  const PaginatedListWidget({Key? key}) : super(key: key);

  @override
  State<PaginatedListWidget> createState() => _PaginatedListWidgetState();
}

class _PaginatedListWidgetState extends State<PaginatedListWidget>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  final List _currentData = [];
  int _lastOffset = 0;
  static const int _itemsPerPage = 15;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchData();
  }

  void _onScroll() {
    if (_isBottomReached && !_isLoading) {
      _fetchData();
    }
  }

  bool get _isBottomReached {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  bool get _isLoading {
    final state = context.read<PaginatedListCubit>().state;
    return state is PaginatedListLoadingState;
  }

  void _fetchData() {
    final newOffset = _lastOffset + 1;
    context.read<PaginatedListCubit>().fetchStoresData(
          offset: newOffset,
          limit: _itemsPerPage,
        );
    _lastOffset = newOffset;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: BlocListener<PaginatedListCubit, PaginatedListState>(
          listener: (context, state) {
            _handleLoadedData(state);
          },
          child: BlocBuilder<PaginatedListCubit, PaginatedListState>(
            builder: (context, state) {
              if (state is PaginatedListInitialState ||
                  (state is PaginatedListLoadingState &&
                      _currentData.isEmpty)) {
                return const ShimmerList(
                  itemsPerPage: _itemsPerPage,
                );
              }

              return PaginatedListView(
                data: _currentData,
                scrollController: _scrollController,
              );
            },
          ),
        ),
        floatingActionButton:
            BlocBuilder<PaginatedListCubit, PaginatedListState>(
                builder: (context, state) {
          return FloatingActionButton.small(
            onPressed: () {},
            child: Text("${_currentData.length}"),
          );
        }));
  }

  void _handleLoadedData(PaginatedListState state) {
    if (state is PaginatedListDataLoadedState) {
      setState(() {
        for (var store in state.stores) {
          if (!_currentData.contains(store)) {
            _currentData.add(store);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
