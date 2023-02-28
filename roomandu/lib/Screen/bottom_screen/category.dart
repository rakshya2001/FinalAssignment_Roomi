import 'package:flutter/material.dart';
import 'package:roomandu/repository/category_repo.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: CategoryRepositoryImpl().fetchCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, "/category_product_screen",
                              arguments: snapshot.data![index].categoryId);
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(snapshot.data![index].category_name!),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
