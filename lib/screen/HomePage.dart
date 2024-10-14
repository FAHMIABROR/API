import 'package:flutter/material.dart';
import 'package:get_api2/screen/get-api.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PageOneApi();
                }));
              },
              child: Text('API 1'),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageOneApi();
              }));
            },
            child: Text('API 1'),
          ),
        ],
      ),
    );
  }
}
