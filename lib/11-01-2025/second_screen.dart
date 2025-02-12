import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_smit/11-01-2025/number_provider.dart';

class SecondScreenCurrent extends StatefulWidget {
  //final List<int> numberList;
  const SecondScreenCurrent({super.key});

  @override
  State<SecondScreenCurrent> createState() => _SecondScreenCurrentState();
}

class _SecondScreenCurrentState extends State<SecondScreenCurrent> {

  @override
  Widget build(BuildContext context) {
    return  Consumer<NumberProvider>(
      builder: (context,value,index) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Provider Example'),),
          floatingActionButton: Container(
            height: 45,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8)
            ),
            child: IconButton(onPressed: () {

              value.addNumber();
              // print('tapped--------');
              // int num = widget.numberList.last;
              // setState(() {
              //   widget.numberList.add(num+1);
              // });

            }, icon: const Icon(Icons.add, color: Colors.white,)),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Center(child: Text(value.numberList.last.toString(),
                style: const TextStyle(fontSize: 40),)),
              const SizedBox(height: 40,),
              SizedBox(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: value.numberList.length,
                    itemBuilder: (context, index) {
                      return Center(child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(value.numberList[index].toString(),
                            style: const TextStyle(fontSize: 30)),
                      ));
                    }),
              ),
            ],
          ),
        );
      });
  }
}
