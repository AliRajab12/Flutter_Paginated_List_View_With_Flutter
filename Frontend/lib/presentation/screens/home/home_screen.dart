import 'package:flutter/material.dart';
import 'package:flutter_with_painated_list_view/presentation/widgets/common/paginated_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paginated List View"),
        centerTitle: true,
      ),
      body: const Column(
        children: [Expanded(child: PaginatedListWidget())],
      ),
    );
  }
}
