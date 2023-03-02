import 'package:flutter/material.dart';
import 'package:roomandu/app/constants.dart';
import 'package:roomandu/repository/user_repo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    print(Constant.userid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        FutureBuilder(
            future: UserRepositoryImp().getAllUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      if (snapshot.data![index].userId == Constant.userid) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 200,
                              child: snapshot.data![index].profile == null
                                  ? const Text('No Image')
                                  : Image.network(
                                      Constant.userImageURL +
                                          snapshot.data![index].profile!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            ListTile(
                              title: Text(snapshot.data![index].firstName!),
                              subtitle: Text(snapshot.data![index].lastName!),
                            ),
                          ],
                        );
                      }
                      return null;
                    });
              } else {
                return const CircularProgressIndicator();
              }
            }),
        const Divider(
          thickness: 1,
        ),
        // Setting buttons
        const ListTile(
          title: Text('Change Details'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        // logout button
        ListTile(
          title: const Text('Logout'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
        //enable FingerPrint
        const ListTile(
          title: Text('Enable FingerPrint'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        //
      ],
    ));
  }
}
