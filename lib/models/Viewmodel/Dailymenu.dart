import 'FoodMeals.dart';

class DailyMenu {
  final Map<String, FoodMeals> menus;

  DailyMenu({required this.menus});

  factory DailyMenu.fromJson(Map<String, dynamic>? json) {
    final Map<String, FoodMeals> menus = {};

    if (json != null) {
      json.forEach((key, value) {
        menus[key] = FoodMeals.fromJson(value);
      });
    }

    return DailyMenu(menus: menus);
  }
}
