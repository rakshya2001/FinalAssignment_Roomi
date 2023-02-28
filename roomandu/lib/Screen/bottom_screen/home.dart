import 'package:flutter/material.dart';
import 'package:roomandu/repository/product_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Home Screen'),
            FutureBuilder(
              future: productRepositoryImpl().fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/productdetails",arguments: snapshot.data![index].productId);
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: snapshot.data![index].image ==
                                                null
                                            ? const Text('No Image')
                                            : Image.network(
                                                snapshot.data![index].image!,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.location_city),
                                              Text(snapshot
                                                  .data![index].room_location!),
                                            ],
                                          )),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            const Icon(Icons.attach_money),
                                            Text(
                                              snapshot.data![index].room_price!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            const Icon(Icons.description),
                                            Text(
                                              snapshot.data![index]
                                                  .room_description!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                      });
                } else {
                  return const Text('No Data');
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
