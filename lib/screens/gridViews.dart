import 'package:flutter/material.dart';

class GridViews extends StatefulWidget {
  const GridViews({Key? key}) : super(key: key);

  @override
  State<GridViews> createState() => _GridViewsState();
}

class _GridViewsState extends State<GridViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reviews'),),
      body: Column(
        children:  [
          const Text("data",style: TextStyle(fontSize: 150),),


          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: List.generate(10, (index) {
                return Text("od.name");
              }
              ),),
          ),


        ],
      ),
    );
  }
}
