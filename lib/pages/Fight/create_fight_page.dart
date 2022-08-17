import 'package:flutter/material.dart';

class Createfightpage extends StatefulWidget {
  const Createfightpage({super.key});

  @override
  State<Createfightpage> createState() => _CreatefightpageState();
}

class _CreatefightpageState extends State<Createfightpage> {
  String dropdownValue = 'username';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100, right: 150),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            child: const Text(
              'Create a fight',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 100, right: 120),
            child: const Text(
              'Choose your opponent',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
//             child: DropdownButton(
//               value: valueChoose,
//               onChanged: (newValue) {
// setState()

//               },
//               items: ListItem.map(
//           ),
            margin: const EdgeInsets.only(top: 1, right: 210),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_drop_down),
              elevation: 16,
              style:
                  const TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
              underline: Container(
                height: 2,
                color: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['username', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 200),
            child: const Text(
              'Match details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 35, left: 35),
            child: TextField(
              maxLines: 4,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),

         Container(
          margin: const EdgeInsets.only(top: 90, left:200),
           child: TextButton (
            
                      onPressed: () {},
                      style: ButtonStyle(                                 
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        
                      ),
            
                      child: const Text("\t\t\tCHALLENGE\t\t\t"
                      ),
                      ),
         )
        ],
      ),
    );
  }
}
