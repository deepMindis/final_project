import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 65, 19, 173),
      //_________________________________________ App Bar _________________________________

      //________________________________________________ Body _________________________
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(

                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'images/bookingbroccess/booking/deulexroom.jpeg',
                        ),
                        fit: BoxFit.cover)),
                //width: MediaQuery.of(context).size.width,
                height: 250,
                // child: Image(
                // image: AssetImage(
                //   'images/bookingbroccess/booking/deulexroom.jpeg'),
                //),
              ),
            ),
            //_________________________________ imamge ______________

            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 65, 19, 173),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              padding: EdgeInsets.all(20),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Meal Name' , style:TextStyle(fontSize: 28 , color: Colors.white),),
                  SizedBox(height: 12,),
                  const Row(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '165\$',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),



                  const SizedBox(
                    height: 20,
                  ),
                  //separator
                  Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: 1.5,
                  ),
                  //__________
                  const SizedBox(
                    height: 25,
                  ),
                  //_____________________ text _____________________

                  const Text(
                    'One king bed Cozy and spacious , with stunning views of Dubai city , Guests will appreciate the uniquely designed living and workspaces that measure 110 sqm',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),

                  //__________
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100),
                    child: Container(
                      width: 170,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(30)),
                      child: MaterialButton(
                        onPressed: (() {}),
                        child: const Text(
                          "Order Now",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),

            //______________________________________________button___________________________
          ],
        ),
      ),
    );
  }


}

class CustomClipPath extends CustomClipper<Path> {
  //var radius = 1.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    //path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width * .5, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
