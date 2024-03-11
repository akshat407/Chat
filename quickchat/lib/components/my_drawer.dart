import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: Column(
        children: [
          DrawerHeader(child: Center(
            child: Icon(Icons.message,size: 24,),
            
          )),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home),
                  onTap: (){
                    
                  },
                  
                
                ),
                
              ),
            ],
          ),
           Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: Icon(Icons.settings),
              onTap: (){
                
              },
              
            
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout),
              onTap: (){
                
              },
              
            
            ),
            
          )
        ],
      ),
    );
  }
}