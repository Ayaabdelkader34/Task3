import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> _login() async {
    const String apiUrl = 'https://my-safe-space.alacrity.technology/api/login';

    final response = await http.post(
      apiUrl as Uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      String accessToken = data['access_token'];
      print('Login successful! Access Token: $accessToken');

    } else {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        errorMessage = data['message'];
      });
      print('Login failed: ${data['message']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(245, 245, 250, 1),
      body:

      Padding(

        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //  Image.asset('images/1.png'),
             const SizedBox(height: 90,),
              const Text(
                'Welcom Back!',
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Circular Std Black ',
                  color: Color.fromRGBO(40, 51, 53, 1),
          
                ),
              ),
              const SizedBox(height: 4,),
              const Text(
                'Login to continue Radio App',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Circular Std Black ',
                  color: Color.fromRGBO(40, 51, 53, 1),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                     color: const Color.fromRGBO(255, 255, 255, 1),
                    child: TextFormField(
                
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration:   InputDecoration(
                
                          border: OutlineInputBorder(
                            borderSide:  const BorderSide(
                                color: Color.fromRGBO(231, 235, 236, 1.0),),
                              borderRadius: BorderRadius.circular(4)),
                
                          prefixIcon: const Icon(Icons.mail_outline,color: Color.fromRGBO(116, 119, 160, 1)),
                            labelText: 'Email Adreess',
                
                        ),
                      ),
                    ),
                    const SizedBox(height: 21,),
                    Container(
                      height: 50,
                      color:const Color.fromRGBO(255, 255, 255, 1),
                
                      child: TextFormField(
                
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        decoration:    InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:  const BorderSide(
                                  color: Colors.transparent),
                                borderRadius: BorderRadius.circular(4)),
                            prefixIcon: const Icon(Icons.lock_outline,color: Color.fromRGBO(116, 119, 160, 1)),
                            labelText: 'Password'),
                      ),
                    ),
                    const SizedBox(height: 3,),
                    Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                
                              shape: const CircleBorder(
                
                              ),
                                value: true, onChanged: (value){},
                            //  checkColor: const Color.fromRGBO(251, 101, 128, 1)
                               ),
                            const SizedBox(width:0.02 ,),
                            const Text('Remember me',
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Circular Std Black ',
                                color: Color.fromRGBO(0, 0, 0, 1),
                
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 78 ,),
                        TextButton(onPressed: (){}, child: const Text('Forgot password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Circular Std Black ',
                            color: Color.fromRGBO(92, 94, 111, 1),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 17),
              InkWell(
                onTap: _login,
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(122, 95, 201, 1),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                  BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
                ],
                  ),
                    child: const Center(child: Text('Log In',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Circular Std Black ',
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ))),
              ),
              if (errorMessage.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 21,),
          
              const Center(
                child: Text('OR',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Circular Std Book ',
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              const SizedBox(height: 19,),
              Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SizedBox(
                      width:27,
                      child: Image.asset(
                      "images/google.png",),
                    ),
                      const SizedBox(width: 4,),
                      const Text('Continue with Google',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Circular Std Black ',
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 19,),
              Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 0, 0, 1),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/apple.png",),
                      Text('Sign in with Apple ID ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Circular Std Black Regular',
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 19,),
          
              Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color:  const Color.fromARGB(255, 42, 82, 151),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/facebook.png",),
                      Text('Continue with Facebook',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Circular Std Black Regular',
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 27,),
          
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Circular Std Book ',
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  Text('Sign up',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Circular Std Book ',
                      color: Color.fromRGBO(109, 77, 198, 1),
                    ),
                  ),
                     ]),
                  const SizedBox(height: 21,),
          
                  const Text('By signing up you indicate that you have read and',
                    style: TextStyle(
                      fontSize: 9,
                      fontFamily: 'Circular Std Book ',
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('agreed tothe Patch',
                        style: TextStyle(
                          fontSize: 9,
                          fontFamily: 'Circular Std Book ',
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      Text(
                        'Terms of Service',
                        style: TextStyle(
                          fontSize: 9,
                          fontFamily: 'Circular Std Book ',
                          color: Color.fromRGBO(109, 77, 198, 1),
                        ),
                      ),
                    ],
                  ),
          
                ],
              ),
        ),








      ),
    );
  }
}