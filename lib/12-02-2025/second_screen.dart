import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_smit/12-02-2025/numbers_provider.dart';
import 'package:state_management_project_smit/componants/button.dart';
import 'first_screen.dart';


class SecondScreen extends StatefulWidget {
  final List<int> numbersList;
  const SecondScreen({super.key, required this.numbersList});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
      builder: (context,value,child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text('Provider Example Second Screen'),
          ),
          floatingActionButton: GestureDetector(
            onTap: () {
              print('tapped-------->');

            value.addNumber();

            },
            child: Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            children: [
              Text(
                value.numberList.last.toString(),
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: value.numberList.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            value.numberList[index].toString(),
                            style: const TextStyle(fontSize: 30),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      });
  }
}
