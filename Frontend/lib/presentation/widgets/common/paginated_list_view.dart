import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_painated_list_view/presentation/Bloc/Cubits/common/paginated_list/paginated_list_cubit.dart';
import 'package:flutter_with_painated_list_view/presentation/Bloc/Cubits/common/paginated_list/paginated_list_state.dart';

class PaginatedListView extends StatelessWidget {
  final ScrollController scrollController;
  final List data;

  const PaginatedListView({
    super.key,
    required this.scrollController,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginatedListCubit, PaginatedListState>(
      builder: (context, state) => ListView.builder(
        controller: scrollController,
        itemCount: data.length +
            (state is PaginatedListDataLoadedState && !state.hasReachedEnd
                ? 1
                : 0),
        itemBuilder: (context, index) {
          if (index < data.length) {
            return ListTile(title: Text(data[index].name));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
