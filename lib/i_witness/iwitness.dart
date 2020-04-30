import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../headline.dart';
import 'i_witness_list.dart';

class firebaseTe extends StatelessWidget{
  final firestoreInstance = Firestore.instance;
  String m_url;
  File imageFile;
  BuildContext mContex;

  final FirebaseStorage _storage = FirebaseStorage(storageBucket: 'gs://fir-testpersonal-ba241.appspot.com');

  Future<String> uploadImage(var imageFile ) async {
    String filePath = 'images/${DateTime.now()}.png';

    StorageUploadTask _uploadTask = _storage.ref().child(filePath).putFile(imageFile);

    var dowurl = await (await _uploadTask.onComplete).ref.getDownloadURL();
    var url = dowurl.toString();
    m_url=url;

    firestoreInstance.collection("userspp").add(
        {
          "description" : "userX userX userX userX userX userX userX userX userX userX userX userX userX userX userX userX",
          "url" : url,
        }).then((_){
      print("success!");
      Navigator.push(
        mContex,
        MaterialPageRoute(builder: (mContext) => Headline()),
      );
    });

    return url;
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    imageFile = selected;

    _cropImage();
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      // maxWidth: 512,
      // maxHeight: 512,
      //toolbarColor: Colors.purple,
      //toolbarWidgetColor: Colors.white,
      //toolbarTitle: 'Crop It'
    );

    imageFile = cropped ?? imageFile;
  }

  @override
  Widget build(BuildContext context) {
    mContex = context;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Add Image"),),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.photo_camera,
                size: 30,
              ),
              onPressed: () => _pickImage(ImageSource.camera),
              color: Colors.blue,
            ),
            IconButton(
              icon: Icon(
                Icons.photo_library,
                size: 30,
              ),
              onPressed: () => _pickImage(ImageSource.gallery),
              color: Colors.pink,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            color: Colors.deepOrange,
            //child: imageFile!=null? Image.file(imageFile): null,
          ),
          Container(
            child: RaisedButton(
              child: Text("firease"),
              onPressed: (){
                //var firebaseUser = await FirebaseAuth.instance.currentUser();
                //firestoreInstance.collection("Lllll").
                uploadImage(imageFile);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget to capture and crop the image
class ImageCapture777 extends StatefulWidget {
  String description = "Add Image";

  createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture777> {
  final firestoreInstance = Firestore.instance;
  String m_url;
  String description;
  File imageFile;
  StorageUploadTask _uploadTask;

  final FirebaseStorage _storage = FirebaseStorage(storageBucket: 'gs://crescent-c1727.appspot.com');

  Future<String> uploadImage() async {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() =>_uploadTask = _storage.ref().child(filePath).putFile(imageFile));

    var dowurl = await (await _uploadTask.onComplete).ref.getDownloadURL();
    var url = dowurl.toString();
    m_url=url;

    firestoreInstance.collection("userspp").add(
        {
          "description" : description,
          "url" : url,
          "timeStamp":Timestamp.now()
        }).then((_){
      print("success!");
      setState(() {
        imageFile = null;
        description = "";
      });
    });

    return url;
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      imageFile = selected;
    });

    _cropImage();
  }

  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      // ratioX: 1.0,
      // ratioY: 1.0,
      // maxWidth: 512,
      // maxHeight: 512,
      //toolbarColor: Colors.purple,
      //toolbarWidgetColor: Colors.white,
      //toolbarTitle: 'Crop It'
    );

    setState(() {
      imageFile = cropped ?? imageFile;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(_uploadTask!=null){
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: StreamBuilder<StorageTaskEvent>(
                stream: _uploadTask.events,
                builder: (context, snapshot) {
                  var event = snapshot?.data?.snapshot;

                  double progressPercent = event != null
                      ? event.bytesTransferred / event.totalByteCount
                      : 0;

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (_uploadTask.isComplete)
                          Text('Done',
                              style: TextStyle(
                                  color: Colors.greenAccent,
                                  height: 2,
                                  fontSize: 30)),
                        if (_uploadTask.isComplete)
                        RaisedButton(
                          child: Text("Go Back"),
                          onPressed: (){
                            Navigator.pop(context);
                            //Navigator.push(
                              //context,
                              //MaterialPageRoute(builder: (context) => Headline()),
                            //);
                          },
                        ),
                        if (_uploadTask.isPaused)
                          FlatButton(
                            child: Icon(Icons.play_arrow, size: 50),
                            onPressed: _uploadTask.resume,
                          ),
                        if (_uploadTask.isInProgress)
                          Text("Uploading..."),
                          FlatButton(
                            child: Icon(Icons.pause, size: 50),
                            onPressed: _uploadTask.pause,
                          ),


                        LinearProgressIndicator(value: progressPercent),
                        Text(
                          '${(progressPercent * 100).toStringAsFixed(2)} % ',
                          style: TextStyle(fontSize: 50),
                        ),
                      ]);
                }),
          ),
        ),
      );
    }else{
      return Scaffold(
        appBar: AppBar(title: Text("Add Image"),),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.photo_camera,
                  size: 30,
                ),
                onPressed: () => _pickImage(ImageSource.camera),
                color: Colors.blue,
              ),
              IconButton(
                icon: Icon(
                  Icons.photo_library,
                  size: 30,
                ),
                onPressed: () => _pickImage(ImageSource.gallery),
                color: Colors.pink,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageFile!=null? FileImage(imageFile): AssetImage(""), fit: BoxFit.cover)),
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: 'Enter a description of your report here'
                ),
                onChanged: (text) {
                  setState(() {
                    description = text;
                  });
                },
              ),
              Container(
                child: RaisedButton(
                  child: Text("Upload"),
                  onPressed: (){
                    //var firebaseUser = await FirebaseAuth.instance.currentUser();
                    //firestoreInstance.collection("Lllll").
                    if(imageFile!=null && description!=""){
                      uploadImage();
                    }else{
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

}