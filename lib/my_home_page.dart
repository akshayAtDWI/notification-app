import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController deviceTokenControler = TextEditingController();

  @override
  void initState() {
   getDeviceToken();
    // TODO: implement initState
    super.initState();
  }

  Future<void> getDeviceToken() async {
     String? token = await FirebaseMessaging.instance.getToken();
    setState(() {
      deviceTokenControler.text = token!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [ElevatedButton(onPressed: (){}, child: const Text("Send Notification")),],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ElevatedButton(onPressed: (){
        
          }, child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              const SizedBox(height: 20,),
              TextField(
                maxLines: 10,
                controller: deviceTokenControler,
                
              )
            ],
          ))
        ),
      ),
    );
  }
}