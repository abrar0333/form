
import"package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'constants/colors.dart';
import 'display_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final formKey = GlobalKey<FormState>();


  TextEditingController userNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? _userName ,
      _dob,
      _aadhar,
      _pan,
      _number,
      _email;

  PickedFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void takephoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile!;
    });
  }


  @override
  Widget build(BuildContext context) {


    Widget nameTextField(){
      return MyTextField(onSaved: (value){
        _userName= value;
        }, onPressed: () {  },
        ).textField(context, userNameController, "Enter Your Name");
    }

    Widget dobTextField(){
      return MyTextField(onSaved: (value){
        _dob= value;
        },
        onPressed: ()  {
        },
         ).textField(context, dobController, "Date of Birth",);
    }

    Widget adhaarTextField(){
      return MyTextField(onSaved: (value){
        _aadhar= value;
        }, onPressed: () {  },
        ).textField(context, aadharController, "Enter Aadhar",keyboardType: TextInputType.number);
    }

    Widget panTextField(){
      return MyTextField(onSaved: (value){
        _pan= value;
        }, onPressed: () {  },
         ).textField(context, panController, "Enter PAN");
    }

    Widget mobileTextField(){
      return MyTextField(onSaved: (value){
        _number= value;
        }, onPressed: () {  },
        ).textField(context, numberController, "Enter number",keyboardType: TextInputType.number);
    }

    Widget emailTextField(){
      return MyTextField(onSaved: (value){
        _email= value;
        }, onPressed: () {  },
         ).textField(context, emailController, "Enter email");
    }


    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text("Customer Details",style: TextStyle(fontSize: 20,color: blackColor),),
      backgroundColor: hintTextColor,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(height: 10,),
              Text("Name",style: TextStyle(fontSize: 14),),
              SizedBox(height: 10,),
              nameTextField(),
              SizedBox(height: 10,),
              Text("DOB",style: TextStyle(fontSize: 14),),
              SizedBox(height: 10,),
              dobTextField(),
              SizedBox(height: 10,),
              Text("Adhaar",style: TextStyle(fontSize: 14),),
              SizedBox(height: 10,),
              adhaarTextField(),
              SizedBox(height: 10,),
              Text("PAN",style: TextStyle(fontSize: 14),),
              SizedBox(height: 10,),
              panTextField(),
              SizedBox(height: 10,),
              Text("Mobile  no",style: TextStyle(fontSize: 14),),
              SizedBox(height: 10,),
              mobileTextField(),
              SizedBox(height: 10,),
              Text("Email",style: TextStyle(fontSize: 14),),
              SizedBox(height: 10,),
              emailTextField(),

              (_imageFile ==  null)? Container() : Container(
                width: 200,height: 200,
                child: Image.file(File( (_imageFile == null)? "" :_imageFile!.path)),
              ),



              SizedBox(height: 10,),

              TextButton.icon(
                onPressed: () {
                  takephoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text("Gallery"),
              ),

              ElevatedButton(
                  onPressed: (){

                  formKey.currentState!.save();
                  if(_userName!.isNotEmpty && _dob!.isNotEmpty && _aadhar!.isNotEmpty && _pan!.isNotEmpty
                  && _number!.isNotEmpty && _email!.isNotEmpty
                  ){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DisplayPage(
                      _userName, _dob, _aadhar, _pan, _number,_email, _imageFile!.path
                    )));
                  }
                  print(_userName);
                  print(_dob);
                  print(_aadhar);
                  print(_pan);
                  print(_number);
                  print(_email);
                  print(_imageFile!.path);

              }, child:  Text("Submit"),

              )

            ],
          ),
        ),
      ),
    );
  }
}


class MyTextField {
  final Function(String?) onSaved;
  final String? Function(String?)? validator;
  final Function() onPressed;
  MyTextField( {required this.onSaved,required this.onPressed,this.validator,});

  Widget textField(BuildContext context, TextEditingController controller,
      String hintText, {bool? isPasswordVisible ,TextInputType keyboardType = TextInputType.text,}){
    return  TextFormField(
        controller: controller,
        onSaved: onSaved,
        obscureText: (isPasswordVisible == true) ? true : false,
        validator: validator,
        style: const TextStyle(fontSize: 14),
        keyboardType: keyboardType,

        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: buttonBackgroundColor, width: 4),
              borderRadius: BorderRadius.circular(10)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: redColor, width: 4),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: redColor, width: 4),
              borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: hintTextColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          errorStyle: const TextStyle(
              fontSize:14,
              fontWeight: FontWeight.bold),

          hintStyle: const TextStyle(
            color: hintTextColor,
            fontSize:14,
            fontWeight: FontWeight.bold,
          ),
        ),
    );
  }
}