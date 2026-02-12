import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  final String nama;

  const Homepage({super.key, required this.nama});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(child: Padding(padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                  ),),
                  const SizedBox(height: 4,),
                  Text('Hey ${widget.nama}! 👋',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),

              Stack(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 26,),
                  )
                ],
              )
            ],
          ),)),
          
          const SizedBox(height: 20),
          
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child:

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5)
                )
              ],
            ),
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: 0.7,
                        strokeWidth: 10,
                        color: Colors.orange,
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Icon(
                      Icons.flash_on,
                      color: Colors.grey,
                      size: 30,
                    )
                  ],
                ),
                const SizedBox(width: 28),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Daily Summary",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    const SizedBox(height: 12,),
                    Text('Steps: • 8.241/8k'),
                    Text('Calories: • 450 kcal'),
                    Text('Time: • 67 min')
                  ],
                )
              ],
            ),
          )
            ,)

        ],
      ),
    );
  }
}
