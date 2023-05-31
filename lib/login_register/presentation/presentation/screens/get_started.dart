import 'package:flutter/material.dart';
import 'package:kraba/login_register/presentation/presentation/screens/login_screen.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: const Image(
              image: AssetImage("images/getstatrt.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          //_____________________________________________________________________
          Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    child: Image.asset(
                      "images/getstartedicon.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const AnimatedOpacity(
                duration: Duration(milliseconds: 420),
                opacity: 1,
                child: Text(
                  "best hotel deals for your holiday",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Expanded(
                flex: 5,
                child: SizedBox(),
              ),
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 680),
                child: Container(
                  width: 220,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(30)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginScreen()));
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
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
