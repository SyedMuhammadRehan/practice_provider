import 'package:flutter/material.dart';
import 'package:practice_provider/provider/favitem_provider.dart';
import 'package:practice_provider/screens/favourite/myfavitem.dart';
import 'package:provider/provider.dart';

class FavItemExample extends StatefulWidget {
  const FavItemExample({super.key});

  @override
  State<FavItemExample> createState() => _FavItemExampleState();
}

class _FavItemExampleState extends State<FavItemExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fav Item"),
        actions: [
          InkWell(
            onTap: (() {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const MyfavItem()));
            }),
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 17,
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Consumer<FavitemProvider>(
                        builder: ((context, value, child) {
                      return ListTile(
                        title: Text("Item $index"),
                        trailing: InkWell(
                            onTap: () {
                              if (value.getitems.contains(index)) {
                                value.rmvitems(index);
                              } else {
                                value.additems(index);
                              }
                            },
                            child: Icon(value.getitems.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_outline)),
                      );
                    }));
                  }))
        ],
      ),
    );
  }
}
