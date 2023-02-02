import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/great_places.dart';
import '../widgets/TakeImage.dart';
import 'dart:io';
import '../widgets/location_input.dart';

class AddPlaces extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  State<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends State<AddPlaces> {
  File? _pickedImage;
  final _titleController = TextEditingController();
  void selectedImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<GreatPlacesProvider>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Add Places"),
      ),
      body: SingleChildScrollView(
        
        child: SizedBox(
           width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Padding(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter Place Name',
                      ),
                    ),
                    SizedBox(height: 30),
                    ImageFile(selectedImage),
                    SizedBox(height: 30),
                    LocationInput(),
                  ],
                ),
                padding: EdgeInsets.all(13),
              )),
              ElevatedButton.icon(
                onPressed: savePlace,
                icon: Icon(Icons.add),
                label: Text('Add Place'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(EdgeInsets.all(11)),
                    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 20))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
