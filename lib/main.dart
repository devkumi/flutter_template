import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      print(_counter);
      _counter++;
    });
  }


  TextEditingController number = TextEditingController();
  TextEditingController password = TextEditingController();
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            //   style: TextStyle(fontSize: 20),
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
            Container(
              margin: const EdgeInsets.only(left: 30,right: 30, top: 15),
              child: SizedBox(
                // height: 60,
                width: double.infinity,
                // alignment: Alignment.centerLeft,
                // margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  onChanged: (value) async {
                    // if(value.length == 1){
                    //   FocusScope.of(context).nextFocus();
                    // }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // print('Please enter some text');
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                  // style: Theme.of(context).textTheme.bodyText2,
                  controller: number,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.start,
                  enableSuggestions: true,
                  autocorrect: true,
                  style: const TextStyle(
                      color: Colors.black
                  ),
                  cursorColor: Colors.black,
                  // autofocus: true,
                  decoration: InputDecoration(
                    floatingLabelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Mobile Number*',
                    suffixIcon: const Align(
                      alignment: Alignment.center,
                      widthFactor: 1.0,
                      heightFactor: 1.0,
                      // child: Icon(
                      //   Icons.person,
                      //   color: Colors.black,
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder( //<-- SEE HERE
                      borderSide: const BorderSide(
                          width: 2, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder( //<-- SEE HERE
                      borderSide: const BorderSide(
                          width: 2, color: Colors.redAccent
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),

                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30,right: 30, top: 15),
              child: SizedBox(
                // height: 60,
                width: double.infinity,
                // alignment: Alignment.centerLeft,
                // margin: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  onChanged: (value){
                    // if(value.length == 1){
                    //   FocusScope.of(context).nextFocus();
                    // }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // print('Please enter some text');
                      return 'Please enter password';
                    }
                    return null;
                  },

                  // style: Theme.of(context).textTheme.bodyText2,
                  obscureText: _obscured,
                  autofillHints: const [AutofillHints.password],
                  focusNode: textFieldFocusNode,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: Colors.grey
                  ),
                  cursorColor: Colors.black,
                  // autofocus: true,
                  decoration: InputDecoration(
                    floatingLabelStyle: const TextStyle(color: Colors.black),
                    labelText: 'Password / Pin',
                    labelStyle: const TextStyle(
                      // color: MyTheme.medium_grey,
                      // fontSize: 16
                    ),
                    suffixIcon:  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: _toggleObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 2, color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder( //<-- SEE HERE
                      borderSide: const BorderSide(
                          width: 2, color: Colors.redAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder( //<-- SEE HERE
                      borderSide: const BorderSide(
                          width: 2, color: Colors.redAccent
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                  ),

                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(top: 30,bottom: 15,left: 30, right: 30),
                  child: Wrap(
                    children: [
                      Material(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(35),
                        child: InkWell(

                          onTap: () async {


                            // if(_formKeyid.currentState?.validate() == false){
                            //
                            // }
                            // else
                            // {
                            //
                            //   // print(Stringclass.login.toString());
                            //   TextInput.finishAutofillContext();
                            //   var pr =  ProgressDialog(context,type: ProgressDialogType.normal, isDismissible: false, showLogs: false);
                            //   pr.style(
                            //       message: 'Please wait...',
                            //       borderRadius: 10.0,
                            //       backgroundColor: Colors.white,
                            //       progressWidget: const CircularProgressIndicator(color: Colors.blue,),
                            //       elevation: 10.0,
                            //       insetAnimCurve: Curves.easeInOut,
                            //       progress: 0.0,
                            //       maxProgress: 100.0,
                            //       progressTextStyle: const TextStyle(
                            //           color: Colors.black, fontSize: 13.0),
                            //       messageTextStyle: const TextStyle(
                            //           color: Colors.black, fontSize: 19.0)
                            //   );
                            //
                            //
                            //   try{
                            //     await pr.show();
                            //     final dataTicket = await http.get(
                            //       Uri.parse(Stringclass.login.toString()),
                            //       headers: <String, String>{
                            //         'Content-Type': 'application/json; charset=UTF-8',
                            //       },
                            //     );
                            //
                            //     if (dataTicket.statusCode == 200) {
                            //       Map dataTicketbody =
                            //       jsonDecode(dataTicket.body);
                            //
                            //       final login = await http.post(Uri.parse("${Stringclass.signin.toString()}"),
                            //         headers: <String, String>{
                            //           'Content-Type': 'application/json; charset=UTF-8',
                            //         },
                            //         body: jsonEncode(<String, String>{
                            //           "dataTicket": dataTicketbody['dataTicket'],
                            //           "telephone": number.text,
                            //           "userPassword": password.text
                            //         }),
                            //       );
                            //
                            //       Map loginbody = jsonDecode(login.body);
                            //
                            //
                            //       print("Responselogin: ${login.body}");
                            //
                            //       // Fluttertoast.showToast(
                            //       //   msg: "Response: ${login.body}",
                            //       //   toastLength: Toast.LENGTH_LONG,
                            //       //   timeInSecForIosWeb: 3,
                            //       //   backgroundColor: Colors.black,
                            //       //   textColor: Colors.white,
                            //       //   fontSize: 16.0,
                            //       // );
                            //
                            //       if(loginbody['mResponse']['statusCode']  == 200){
                            //
                            //         print("Responseimage: ${loginbody['mResponse']['image']}");
                            //         SharedPreferences pref = await SharedPreferences.getInstance();
                            //
                            //
                            //
                            //         if(loginbody['mResponse']['email'] != null){
                            //
                            //           pref.setString("userId", loginbody['mResponse']['userID']);
                            //           pref.setString("email", loginbody['mResponse']['email']);
                            //           pref.setString("telephone", loginbody['mResponse']['telephone']);
                            //           pref.setString("identification", loginbody['mResponse']['identification']);
                            //           pref.setString("firstname", loginbody['mResponse']['firstname']);
                            //           pref.setString("surname", loginbody['mResponse']['surname']);
                            //           pref.setString("othername", loginbody['mResponse']['othername']);
                            //           pref.setString("dateOfBirth", loginbody['mResponse']['dateOfBirth']);
                            //           if(loginbody['mResponse']['image'] == ""){
                            //             pref.setString("profileimg", Stringclass.profilepicavatar);
                            //           }else{
                            //             pref.setString("profileimg", loginbody['mResponse']['image']);
                            //           }
                            //
                            //           pref.setString("status", "logindone");
                            //
                            //
                            //           await pr.hide();
                            //           Navigator.pushReplacement(context,
                            //               PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation) => const MainMenu(),
                            //                 transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            //                   const begin = Offset(5.0, 0.0);//ltr
                            //                   // const begin = Offset(-5.0, 0.0);rtl
                            //                   const end = Offset.zero;
                            //                   const curve = Curves.ease;
                            //
                            //                   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            //
                            //                   return SlideTransition(
                            //                     position: animation.drive(tween),
                            //                     child: child,
                            //                   );
                            //                 },
                            //               )
                            //           );
                            //
                            //         }else{
                            //           // pref.setString("userId", loginbody['mResponse']['userID']);
                            //           // pref.setString("email", loginbody['mResponse']['email']);
                            //           // pref.setString("telephone", loginbody['mResponse']['telephone']);
                            //           // pref.setString("identification", loginbody['mResponse']['identification']);
                            //           // pref.setString("firstname", loginbody['mResponse']['firstname']);
                            //           // pref.setString("surname", loginbody['mResponse']['surname']);
                            //           // pref.setString("surname", loginbody['mResponse']['othername']);
                            //           // pref.setString("dateOfBirth", loginbody['mResponse']['dateOfBirth']);
                            //           // pref.setString("status", "logindone");
                            //
                            //           String? userId = loginbody['mResponse']['userID'];
                            //
                            //           await pr.hide();
                            //           Navigator.pushReplacement(context,
                            //               PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation) => CreateProfile(userID: userId!),
                            //                 transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            //                   const begin = Offset(5.0, 0.0);//ltr
                            //                   // const begin = Offset(-5.0, 0.0);rtl
                            //                   const end = Offset.zero;
                            //                   const curve = Curves.ease;
                            //
                            //                   var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                            //
                            //                   return SlideTransition(
                            //                     position: animation.drive(tween),
                            //                     child: child,
                            //                   );
                            //                 },
                            //               )
                            //           );
                            //         }
                            //
                            //       }else{
                            //
                            //         String message = loginbody['mResponse']['message'];
                            //
                            //         await pr.hide();
                            //
                            //         showDialog(
                            //           context: context,
                            //           builder: (context) => AlertDialog(
                            //             shape: const RoundedRectangleBorder(
                            //                 borderRadius: BorderRadius.all(Radius.circular(20))),
                            //             title: const Center(child: Text('Sorry')),
                            //             content: Text(
                            //               message,
                            //               textAlign: TextAlign.center,
                            //             ),
                            //           ),
                            //         );
                            //       }
                            //     }else{
                            //       pr.hide();
                            //       showDialog(
                            //         context: context,
                            //         builder: (context) => const AlertDialog(
                            //           shape:  RoundedRectangleBorder(
                            //               borderRadius: BorderRadius.all(Radius.circular(20))),
                            //           title: Center(child: Text('Connection failed')),
                            //           content: Text("Check your internet and try again",
                            //             textAlign: TextAlign.center,
                            //           ),
                            //         ),
                            //       );
                            //     }
                            //   } on Exception catch (_) {
                            //     /// In the event of an exception, take the user back and show a SnackBar error.
                            //     // Navigator.pop(context);
                            //     pr.hide();
                            //     ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            //     var snackBar = const SnackBar(
                            //         content: Text("Error occurred, Please check your internet"));
                            //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            //   }
                            // }


                          },
                          borderRadius: BorderRadius.circular(35),
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20,bottom: 10),
                        child: Center(
                            child: GestureDetector(
                                onTap: () {

                                  // scaffoldKey.currentState!.openDrawer();
                                  // print("tapped");

                                  // Navigator.pushReplacement(context,
                                  //     PageRouteBuilder(pageBuilder:(context, animation, secondaryAnimation) => const ForgotPassword(),
                                  //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  //         // const begin = Offset(1.0, 0.0);//ltr
                                  //         const begin = Offset(-5.0, 0.0); //rtl
                                  //         const end = Offset.zero;
                                  //         const curve = Curves.ease;
                                  //
                                  //         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  //
                                  //         return SlideTransition(
                                  //           position: animation.drive(tween),
                                  //           child: child,
                                  //         );
                                  //       },
                                  //     )
                                  // );
                                },
                                child: const Text("Forgot Password ?", style: TextStyle(
                                  color: Colors.blue,

                                ),
                                )
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
