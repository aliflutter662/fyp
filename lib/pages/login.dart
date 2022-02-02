import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_fyp/pages/forgot_password.dart';
import 'package:my_fyp/pages/signup.dart';
import 'package:my_fyp/role/userManagement.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //final _auth = FirebaseAuth.instance;

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // if (FirebaseAuth.instance != null) {
      //   //print('Successs);

      // }
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => UserManagement().authorizeAccess(context),
      //   ),
      // );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("User Login"),
      // ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: 130,
                child: Center(
                  child: Image.asset('images/sufwan.jpeg'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Email';
                    } else if (!value.contains('@')) {
                      return 'Please Enter Valid Email';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password: ',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          maximumSize: const Size(200, 50),
                        ),
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              email = emailController.text;
                              password = passwordController.text;
                              // UserManagement().handleAuth();
                              UserManagement()
                                  .authorizeAccess(context, email, password);
                              // GestureDetector(
                              //   onTap: () =>

                              // );
                            });
                            userLogin();
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () => {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => ForgotPassword(),
                    //       ),
                    //     )
                    //   },
                    //   child: Text(
                    //     'Forgot Password ?',
                    //     style: TextStyle(fontSize: 14.0),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an Account? "),
                    TextButton(
                      onPressed: () => {
                        Navigator.pushAndRemoveUntil(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => Signup(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                            (route) => false)
                      },
                      child: Text('Signup'),
                    ),
                    // TextButton(
                    //   onPressed: () => {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (context, a, b) => UserMain(),
                    //           transitionDuration: Duration(seconds: 0),
                    //         ),
                    //         (route) => false)
                    //   },
                    //   child: Text('Dashboard'),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
