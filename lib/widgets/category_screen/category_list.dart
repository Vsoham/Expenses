import 'package:expense/models/ex_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';
import './category_card.dart';
class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
        builder: (_,db,__){
          var list= db.categories;
          return ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: list.length,
            itemBuilder: (_,i)=> CategoryCard(list[i])
          );
        }
    );
  }
}

class CategoryCard extends StatelessWidget {
  final ExpenseCategory category;
  const CategoryCard(this.category,{super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(category.icon),
      ),
      title: Text(category.title),
      subtitle: Text('entries:${category.entries}'),
      trailing: Text('₹ ${(category.totalAmount).toStringAsFixed(2)}'),
    );
  }
}
