import 'package:flutter/material.dart';
import 'package:user_app/api.dart';
import 'package:user_app/models/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserPage(),
    );
  }
}

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<UserModel>(
          future: api.fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }

            return snapshot.hasData
                ? SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: NetworkImage(snapshot.data!.picture),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text('Gender'),
                            subtitle: Text('${snapshot.data!.gender}'),
                          ),
                        ),
                        Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: ListTile(
                            leading: Icon(Icons.location_city),
                            title: Text('City'),
                            subtitle: Text('${snapshot.data!.city}'),
                          ),
                        ),
                        Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: ListTile(
                            leading: Icon(Icons.flag),
                            title: Text('Country'),
                            subtitle: Text('${snapshot.data!.country}'),
                          ),
                        ),
                      ],
                    ),
                  )
                : Text('Press button to fetch a user');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.refresh,
          color: Colors.white,
        ),
        tooltip: 'Fetch User',
      ),
    );
  }
}
