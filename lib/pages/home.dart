import 'package:flutter/material.dart';

import '../configs/styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Styles.mainColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 350,
                decoration: const BoxDecoration(
                    color: Styles.mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    )),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 120),
                child: const Icon(
                  Icons.chat,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 160),
                child: const Text(
                  'TikTalk',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 240, left: 45, right: 45),
                child: Container(
                  height: 350,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  child: Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.only(
                              top: 40, left: 40, right: 40),
                          child: const Text(
                            'Welcome to TikTalk',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 20),
                          )),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonFilledStyles,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                child: const Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 40, left: 40, right: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: Styles.buttonStyles,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(color: Styles.mainColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
