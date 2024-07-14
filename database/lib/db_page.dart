import 'package:database/db_functions.dart';
import 'package:flutter/material.dart';

class DbPage extends StatefulWidget {
  const DbPage({super.key});

  @override
  State<DbPage> createState() => _DbPageState();
}

class _DbPageState extends State<DbPage> {
  List userdata = [];
  @override
  void initState() {
    // TODO: implement initState
    userDetailsss();
    super.initState();
  }

  void userDetailsss() async {
    userdata = await getUserDetails();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(userdata);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  TextButton(
                    style: const ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.grey,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Clear Table',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  TextButton(
                    style: const ButtonStyle(
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.grey,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Refresh',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Login Details',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ID",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 5000,
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: userdata.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userdata[index]['id'].toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userdata[index]['email'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          userdata[index]['password'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
