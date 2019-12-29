import 'dart:io';

import './firebase_api.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';

class AddVoterDialog extends StatefulWidget {
  final String name;
  final String docId;
  final String email;
  final String mobile;
  final String roll;

  AddVoterDialog({this.name, this.docId,this.email,this.mobile,this.roll});

  @override
  _AddVoterDialogState createState() => _AddVoterDialogState();
}

class _AddVoterDialogState extends State<AddVoterDialog> {
  final _formAddVoterKey = GlobalKey<FormState>();
  String _name;
  String _email;
  String _mobile;
  String _Roll;
//  Future<File> _imageFile;

  String validateName(String value) {
    if (value.isEmpty) {
      return "Please Enter Voter name.";
    } else {
      return null;
    }
  }
  String validateEmail(String value) {
    if (value.isEmpty) {
      return "Please Enter Voter email.";
    } else {
      return null;
    }
  }

  String validateMobile(String value) {
    if (value.isEmpty) {
      return "Enter Valid Mobile No.";

    } else {
      return null;
    }
  }

  String validateRoll(String value) {
    if (value.isEmpty) {
      return "Enter Valid Roll No.";

    } else {
      return null;
    }
  }



//  Widget _previewImage() {
//    return FutureBuilder<File>(
//        future: _imageFile,
//        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//          if (snapshot.connectionState == ConnectionState.done &&
//              snapshot.data != null) {
//            return Image.file(snapshot.data);
//          } else if (snapshot.error != null) {
//            return const Text(
//              'Error picking image.',
//              textAlign: TextAlign.center,
//            );
//          } else {
//            return const Text(
//              'You have not yet picked an image.',
//              textAlign: TextAlign.center,
//            );
//          }
//        });
//  }

//  getImage(){
//    _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              final form = _formAddVoterKey.currentState;
              if (form.validate()) {
                form.save();
                if (widget.name != null && widget.name.isNotEmpty && widget.email !=null && widget.email.isNotEmpty && widget.mobile != null && widget.mobile.isNotEmpty  && widget.roll != null && widget.roll.isNotEmpty) {
                  FireBaseAPI.updateVoter(widget.docId, _name,_email,_mobile,_Roll);
                } else {
                  FireBaseAPI.addVoter(_name,_email,_mobile,_Roll);
                }
                Navigator.pop(context);
              }
            },
            child: Text(
              widget.name != null && widget.name.isNotEmpty && widget.email !=null && widget.email.isNotEmpty && widget.mobile != null && widget.mobile.isNotEmpty  && widget.roll != null && widget.roll.isNotEmpty? "UPDATE" : 'SAVE',




              style: Theme.of(context)
                  .textTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),

          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Form(
          key: _formAddVoterKey,
          child:Column(
            children: <Widget>[

              Padding(padding: EdgeInsets.only(top: 15),
              child:TextFormField(
            decoration: InputDecoration(
              labelText: 'Voter name',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.text,
            initialValue: widget.name != null && widget.name.isNotEmpty
                ? widget.name
                : "",
            validator: (value) {
              return validateName(value);
            },
            onSaved: (value) => _name = value,
          )),
              Padding(padding: EdgeInsets.only(top: 15),
                  child:TextFormField(
                decoration: InputDecoration(
                  labelText: 'Voter email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.text,
                initialValue: widget.email != null && widget.email.isNotEmpty
                    ? widget.email
                    : "",
                validator: (value) {
                  return validateEmail(value);
                },
                onSaved: (value) => _email = value,
              )),

              Padding(padding: EdgeInsets.only(top: 15),
                  child:TextFormField(
                decoration: InputDecoration(
                  labelText: 'Voter Mobile',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.number,
                initialValue: widget.mobile != null && widget.mobile.isNotEmpty
                    ? widget.mobile
                    : "",
                validator: (value) {
                  return validateMobile(value);
                },
                onSaved: (value) => _mobile = value,
                  )),

              Padding(padding: EdgeInsets.only(top: 15),
              child:TextFormField(
                decoration: InputDecoration(
                  labelText: 'Voter Roll.No.',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.contacts),
                ),
                keyboardType: TextInputType.number,
                initialValue: widget.roll != null && widget.roll.isNotEmpty
                    ? widget.roll
                    : "",
                validator: (value) {
                  return validateRoll(value);
                },
                onSaved: (value) => _Roll = value,
              ),


              )]),

      ),

      ) );
  }
}