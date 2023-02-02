import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class ImageFile extends StatefulWidget {
  final Function selectedImage;
  ImageFile(this.selectedImage);
  @override
  State<ImageFile> createState() => _ImageFileState();
}

class _ImageFileState extends State<ImageFile> {
  late File? _storedImage = null;
  Future<void> TakeImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    WidgetsFlutterBinding.ensureInitialized();
    final dir = await sysPath.getApplicationDocumentsDirectory();
    print("Path Allowd is" + _storedImage!.path);
    print("Name of Image is" + dir.path);
    final fileName = path.basename(_storedImage!.path);
    final savedImage = await _storedImage!.copy('${dir.path}/$fileName');
    widget.selectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Colors.grey)),
              child: _storedImage != null
                  ? Image.file(
                      _storedImage!,
                      fit: BoxFit.cover,
                      width: 150,
                      height: 150,
                    )
                  : Text(
                      "No Image",
                      textAlign: TextAlign.center,
                    )),
          	TextButton.icon(
              onPressed: TakeImage,
               style: ButtonStyle(
                iconColor: MaterialStateProperty.all(Colors.indigo),
                foregroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
              icon: Icon(Icons.add_a_photo),
              label: Text("Take Photo"))
        ],
      ),
    );
  }
}
