import 'package:flutter/material.dart';
import 'addPlace_screen.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Places List",
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaces.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlacesProvider>(context, listen: false).getPlaces(),
        builder: (ctx, snapShot) =>
            snapShot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : Consumer<GreatPlacesProvider>(
                    child: const Center(
                      child: Text('Got no places yet, start adding some!'),
                    ),
                    builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
                        ? ch!
                        : ListView.builder(
                            itemBuilder: (ctx, index) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlaces.items[index].image!,
                                ),
                              ),
                              title: Text(greatPlaces.items[index].title!),
                              onTap: () {},
                            ),
                            itemCount: greatPlaces.items.length,
                          ),
                  ),
      ),
    );
  }
}
