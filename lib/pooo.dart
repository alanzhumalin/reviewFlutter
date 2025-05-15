import 'package:flutter/material.dart';

class Pooo extends StatelessWidget {
  const Pooo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(
              'My profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text('A'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alan Zhumalin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        'Major: Computer Science',
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
