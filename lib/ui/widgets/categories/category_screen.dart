import 'package:appaula04/data/restaurant_data.dart';
import 'package:appaula04/model/restaurant.dart';
import 'package:appaula04/ui/_core/app_colors.dart';
import 'package:appaula04/ui/_core/appbar.dart';
import 'package:appaula04/ui/widgets/restaurant/restaurantscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    List<Restaurant> filteredRestaurants = restaurantData.listRestaurant
        .where((restaurant) => restaurant.categories.contains(category))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: getAppBar(context: context, title: category),
      body: SafeArea(
        child: filteredRestaurants.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Nenhum restaurante encontrado para $category ainda',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: filteredRestaurants.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  Restaurant restaurant = filteredRestaurants[index];
                  return _CategoryRestaurantCard(restaurant: restaurant);
                },
              ),
      ),
    );
  }
}

class _CategoryRestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const _CategoryRestaurantCard({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Restaurantscreen(restaurant: restaurant),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderColor),
        ),
        child: Row(
          spacing: 12,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/${restaurant.imagePath}',
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    restaurant.name,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Icon(Icons.star_rounded,
                          size: 16, color: AppColors.warningColor),
                      Text(
                        restaurant.stars.toStringAsFixed(1),
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '· ${restaurant.distance} km',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
