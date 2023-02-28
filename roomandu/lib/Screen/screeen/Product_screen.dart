import 'package:flutter/material.dart';
import 'package:roomandu/app/constants.dart';
import 'package:roomandu/repository/product_repo.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String? id;
  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as String?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Screen'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: productRepositoryImpl().fetchProductById(id!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 400,
                              width: 500,
                              child: snapshot.data![index].image == null
                                  ? const Text('No Image')
                                  : Image.network(
                                      Constant.userImageURL +snapshot.data![index].image!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Row(children: [
                              SizedBox(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_city_outlined),
                                      Text(
                                          snapshot.data![index].room_location!),
                                    ],
                                  )),
                              SizedBox(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      const Icon(Icons.price_check),
                                      Text(snapshot.data![index].room_price!),
                                    ],
                                  )),
                            ]),
                            SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    const Icon(Icons.description),
                                    Text(snapshot
                                        .data![index].room_description!),
                                  ],
                                )),
                            const SizedBox(
                              height: 100,
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text("Book Now")),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ));
  }
}
