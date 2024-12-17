import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text("Cart", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(height: 6,),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) => Column(
                children: [

                  Row(
                    children: [

                      ClipOval(
                        child: Container(
                            width: 70,
                            height: 70,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,),
                            child: Image.asset("", fit: BoxFit.cover, errorBuilder: (context, error, stackTrace){
                              return const Icon(Icons.error);
                            },

                        ),
                      ),
                      ),


                    ],
                  )

                ],
              ),),

        ),
      ) ,
    );
  }
}
