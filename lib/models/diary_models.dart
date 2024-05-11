class User {
  final String id;
  final String username;
  final String email;
  List<Diary> diaries;

  User({required this.id, required this.username, required this.email, this.diaries = const []});
}

class Diary{
  final DateTime date;
  final int calorieTotal;
  List<Meal> meals;

  Diary({required this.date, required this.calorieTotal, this.meals = const []});

  factory Diary.fromJson(Map<String, dynamic> json) {
    var list = json['meals'] as List;
    List<Meal> mealsList = list.map((i) => Meal.fromJson(i)).toList();
    return Diary(
      date: DateTime.parse(json['date']),
      calorieTotal: json['calorie_total'],
      meals: mealsList,
    );
  }
}

class Meal {
  final String id;
  final String name;
  final double calories;
  final double grams;
  final DateTime mealStartTime;
  List<Ingredient> ingredients;

  Meal({required this.id, required this.name, required this.calories, required this.grams, required this.mealStartTime, this.ingredients = const []});

  factory Meal.fromJson(Map<String, dynamic> json) {
    var ingrList = json['ingredients'] as List;
    List<Ingredient> ingredientList = ingrList.map((i) => Ingredient.fromJson(i)).toList();
    return Meal(
      id: json['id'],
      name: json['name'],
      calories: json['calories'],
      grams: json['grams'],
      mealStartTime: DateTime.parse(json['meal_start_time']),
      ingredients: ingredientList,
    );
  }
}

class Ingredient{
  final String id;
  final String name;
  final int grams;
  final double calories;
  final double caloriesPer100Grams;

  Ingredient({required this.id, required this.name, required this.grams, required this.calories, required this.caloriesPer100Grams});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      grams: json['grams'],
      calories: json['calories'],
      caloriesPer100Grams: json['calories_per_100_grams'],
    );
  }
}