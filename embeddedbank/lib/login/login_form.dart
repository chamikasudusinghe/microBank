import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sqflite/sqflite.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController;
  TextEditingController pwController;

  @override
  void initState() {
    emailController = TextEditingController();
    pwController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(30, 15, 20, 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ('Please Enter Email Address');
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                controller: pwController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(30, 15, 20, 15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0)),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return ('Please Enter Password');
                  }
                  return null;
                },
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Foget Password?",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () async{
                  String email = emailController.text;
                  String pw = pwController.text;
                  print(email);
                  // Val
                  //Database db = await DataBaseHelper.instance.db;
                  //var result = await db.query('MBA_accounts', where: 'username = ?', whereArgs:[username]);
                  if(true){
                    //MBA_account acc = MBA_account.fromMap(result.first);
                    if (false){
                      //Navigator.pushReplacementNamed(context, '/options',arguments: {'acc':acc});
                    }
                    else{
                      Alert(context: context,title: 'Incorrect Password').show();
                    }
                  }
                  else{
                      Alert(context: context,title: 'User Does Not Exists').show();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Login', style: TextStyle(fontSize: 20)),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                color: Colors.amber,
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
