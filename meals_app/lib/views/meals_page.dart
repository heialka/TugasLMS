import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../models/category.dart';
import '../models/meal.dart';

class MealsPage extends StatefulWidget {
  final Category category;

  MealsPage({required this.category});

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  Future<List<Meal>> _getMeals() async {
    var response = await http.get(Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=${widget.category.name}"));
    if (response.statusCode == 200) {
      List<Meal> meals = [];
      var data = json.decode(response.body)['meals'];
      if (data != null) {
        for (var meal in data) {
          meals.add(Meal.fromJson(meal));
        }
      }
      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: FutureBuilder<List<Meal>>(
        future: _getMeals(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Tentukan jumlah kolom di sini
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    elevation: 5.0,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Colors.black
                                  .withOpacity(0.5), // Atur opacity di sini
                              BlendMode.srcOver,
                            ),
                            child: Image.network(
                              snapshot.data![index].imageUrl,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 100,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            child: Text(
                              snapshot.data![index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight
                                    .bold, // membuat teks menjadi bold
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 3, // maksimal 2 baris
                              overflow: TextOverflow
                                  .ellipsis, // untuk menghindari pemotongan teks
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
