import 'package:appaula04/model/dish.dart';
import 'package:appaula04/model/restaurant.dart';
import 'package:appaula04/ui/_core/app_colors.dart';
import 'package:appaula04/ui/_core/appbar.dart';
import 'package:appaula04/ui/widgets/bag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Restaurantscreen extends StatelessWidget {
  final Restaurant restaurant; // cria a variavel restaurant
  const Restaurantscreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              Image.asset(
                'assets/${restaurant.imagePath}',
                width: 128,
              ),
              const SizedBox(height: 12),

              // Seção: Mais pedidos (pratos)
              if (restaurant.dishes.isNotEmpty)
                _MenuSection(
                  title: 'Mais pedidos',
                  items: restaurant.dishes,
                ),

              // Seção: Bebidas (só aparece se o restaurante tiver bebidas)
              if (restaurant.drinks.isNotEmpty)
                _MenuSection(
                  title: 'Bebidas',
                  items: restaurant.drinks,
                ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

/// Seção de cardápio reutilizada para pratos e bebidas —
/// mesmo layout, só muda o título e a lista de itens.
class _MenuSection extends StatelessWidget {
  final String title;
  final List<Dish> items;

  const _MenuSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: Text(
              title,
              style: TextStyle(
                color: AppColors.mainColorPressed,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: List.generate(items.length, (index) {
              Dish item = items[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/${item.imagePath}',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/dishes/default.png',
                      width: 48,
                      height: 48,
                    ),
                  ),
                ),
                title: Text(item.name),
                subtitle: Text('R\$${item.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  onPressed: () {
                    context.read<BagProvider>().addAllDishes([item]);
                  },
                  icon: Icon(Icons.add_circle_outline,
                      color: AppColors.mainColorPressed),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
