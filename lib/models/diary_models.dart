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
}

class Meal {
  final String name;
  final double calories;
  final double grams;
  final DateTime mealStartTime;
  List<Ingredient> ingredients;

  Meal({required this.name, required this.calories, required this.grams, required this.mealStartTime, this.ingredients = const []});
}

class Ingredient{
  final String name;
  final double grams;
  final double calories;
  final double caloriesPer100Grams;

  Ingredient({required this.name, required this.grams, required this.calories, required this.caloriesPer100Grams});
}