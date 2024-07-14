import 'package:database/db_functions.dart';
import 'package:database/db_page.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passcontroller = TextEditingController();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Image(
                  height: 80,
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmcnqwd4r4L94Youz9rkGdXLBWF3d9wUpH9g&s",
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Email",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: passcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "password",
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Forget Password',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    // var db = await openDatabase('userDetails');
                    // if (db.isOpen) {
                    //   await db.execute(
                    //     'CREATE TABLE Test (id INTEGER PRIMARY KEY, email TEXT, password TEXT)',
                    //   );
                    //   int id1 = await db.rawInsert(
                    //     'INSERT INTO Test(name, value) VALUES("some name", "testdb")',
                    //   );
                    //   print('inserted1: $id1');
                    // }

                    if (emailcontroller.text.isNotEmpty &&
                        passcontroller.text.isNotEmpty) {
                      inserUserDetails(
                        emailcontroller.text,
                        passcontroller.text,
                      );
                      _navigateTodb(context);
                    }
                  },
                  style: const ButtonStyle(
                    // minimumSize: WidgetStatePropertyAll(Size(500, 50)),
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigateTodb(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DbPage(),
      ),
    );
  }
}
