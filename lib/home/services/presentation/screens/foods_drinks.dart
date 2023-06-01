import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodsDrinks extends StatelessWidget {
  const FoodsDrinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 4,

        itemBuilder: (context , index)
        {
          return InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                      height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      child: const Image(image: AssetImage('images/bookingbroccess/start.jpeg'), fit: BoxFit.cover,) ,
                    ),
                    const SizedBox(height: 8,) ,
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text('meal name' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                          Text('price : ' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w700),),
                          SizedBox(width: 10,),
                          Text('25\$' , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
