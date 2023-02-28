import 'package:flutter/material.dart';
import 'package:roomandu/repository/category_repo.dart';

class Category_product_screen extends StatefulWidget {
  const Category_product_screen({super.key});

  @override
  State<Category_product_screen> createState() =>
      _Category_product_screenState();
}

class _Category_product_screenState extends State<Category_product_screen> {
  String? id;
  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Product Screen'),
      ),
      body: Container(
          child: FutureBuilder(
              future: CategoryRepositoryImpl().fetchCategoryById(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            // title: Text(snapshot.data![index].product.!),
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
