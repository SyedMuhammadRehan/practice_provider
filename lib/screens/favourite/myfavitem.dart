import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favitem_provider.dart';

class MyfavItem extends StatefulWidget {
  const MyfavItem({super.key});

  @override
  State<MyfavItem> createState() => _MyfavItemState();
}

class _MyfavItemState extends State<MyfavItem> {
  @override
  Widget build(BuildContext context) {
    final favprovider = Provider.of<FavitemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Items"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favprovider.getitems.length,
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
