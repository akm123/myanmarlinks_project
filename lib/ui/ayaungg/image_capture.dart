import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ImageCapture extends StatefulWidget {
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('akm'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: imageFile == null
                ? FlatButton(
                    onPressed: () {
                      _showDialog();
                    },
                    child: Icon(
                      Icons.add_a_photo,
                      size: 80,
                      color: Color(0xffff2fc3),
                    ))
                : Image.file(
                    imageFile,
                    width: 200,
                    height: 100,
                  ),
          ),
                      SizedBox(height: 10,),

            RaisedButton(
                onPressed: (){

                  if(imageFile == null){
                    Fluttertoast.showToast(
                        msg: "Please select an image",
                      gravity: ToastGravity.CENTER,
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 2
                    );
                  }else {
                    upload();
                  }

                },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Color(0xffff2fc3),
              child: Text("Upload",style: TextStyle(fontSize: 18,color: Colors.blue),),
            )
        ],
      ),
    );
  }

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            title: Text("You want take a photo from ?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallary"),
                    onTap: () {
                      openGallary();
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      openCamera();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> openGallary() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
  }

  Future<void> openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
  }

  Future<void> upload() async {
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("images")
        .child(new DateTime.now().millisecondsSinceEpoch.toString() +
            "." +
            imageFile.path);
    StorageUploadTask uploadTask = reference.putFile(imageFile);

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = imageUrl.toString();
    print(url);
  }
}
