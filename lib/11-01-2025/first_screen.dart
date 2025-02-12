import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_smit/11-01-2025/number_provider.dart';
import 'package:state_management_project_smit/11-01-2025/second_screen.dart';
import 'package:state_management_project_smit/componants/button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

 // List<int> numberList = [1,2,3,4];

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
              print('tapped--------');
              value.addNumber();
              // int num = numberList.last;
              // setState(() {
              //   numberList.add(num + 1);
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
                height: 400,
                child: ListView.builder(
                    itemCount: value.numberList.length,
                    itemBuilder: (context, index) {
                      return Center(child: Text(
                          value.numberList[index].toString(), style: const TextStyle(
                          fontSize: 30)));
                    }),
              ),
              const SizedBox(height: 40,),
              Button(title: 'Second Screen', onTap: () {

                value.loginAPIFunction(email: 'mudassirtesting@gmail.com', password: '1122334455');

                //Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()));
              }, isLoading: value.isLoading, color: Colors.teal),
            ],
          ),
        );
      });
  }
}
