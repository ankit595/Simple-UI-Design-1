import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp((MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: "Itim",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: AnimatedSplashScreen(
            duration: 3000,
            splash: "assets/logo.png",
            splashIconSize: 100,
            nextScreen: MainScreen(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Colors.teal));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Container(
              height: MediaQuery.of(context).size.height * 0.16,
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/logo1.png'),
              ),
            ),
            Text(
              "Welcome to E-Com",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal[300]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "sign-in to continue",
              style: TextStyle(color: Colors.teal, fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_outline,
                    ),
                    labelText: "Enter Your Mail",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                    ),
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.teal, onPrimary: Colors.white),
                onPressed: () {},
                child: Text("Sign-in"),
              ),
            ),
            Text(
              "OR",
              style: TextStyle(fontSize: 15),
            ),
            GestureDetector(
              child: InkWell(
                splashColor: Colors.teal,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Image(
                              image: AssetImage("assets/google.png"), width: 32),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * .2),
                        Text("Login with Google")
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                print("google");
              },
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Card(
                    elevation: 2,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Image(
                              image: AssetImage("assets/facebok.png"),
                              width: 36),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width * .2),
                        Text("Login with Facebook")
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                print("facebook");
              },
            ),
            TextButton(
                onPressed: () {
                  print("Working");
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(fontFamily: "Itim", color: Colors.teal),
                )),
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.black, fontSize: 15, fontFamily: "Itim"),
                  children: <TextSpan>[
                    TextSpan(
                      text: '  Register',
                      style: TextStyle(
                          color: Colors.teal, fontSize: 15, fontFamily: "Itim"),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Done");
                        },
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
