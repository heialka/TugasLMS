// lib/models/meal.dart
class Meal {
  final String id;
  final String name;
  final String imageUrl; // Tambahkan property imageUrl

  Meal({required this.id, required this.name, required this.imageUrl});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      imageUrl: json['strMealThumb'], // Ambil URL gambar dari API
    );
  }
}
