import 'package:flutter/material.dart';
import 'dart:io';

class DisplayPage extends StatefulWidget {
  String? _userName,
  _dob,
  _aadhar,
  _pan,
  _number,
  _email,
  _imageFile;
  DisplayPage(
      this._userName,this._dob,this._aadhar,this._pan,this._number,this._email,this._imageFile,{super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Display"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text("Name : ${widget._userName!}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("DOB : ${widget._dob!}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("Aadhar : ${widget._aadhar!}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("PAN :${widget._pan!}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("Mobile No : ${widget._number!}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
            Text("Email : ${widget._email!}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            SizedBox(height: 10,),
             Container(
              width: 400,height: 400,
              child: Image.file(File( (widget._imageFile!))),
            ),
          ],
        ),
      ),
    );
  }
}