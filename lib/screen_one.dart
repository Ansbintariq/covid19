import 'package:covid_app/main.dart';
import 'package:flutter/material.dart';

class HomeCovid extends StatefulWidget {
  const HomeCovid({super.key});

  @override
  State<HomeCovid> createState() => _HomeCovidState();
}

class _HomeCovidState extends State<HomeCovid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .6,
            width: MediaQuery.of(context).size.width * 1,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/covid.png"), fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.grey),
            height: MediaQuery.of(context).size.height * .4,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                Row(
                  children: const [
                    Text(
                      "Be aware",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 35,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Stay healthy",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 35,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Welcome to COVID-19 information portal.",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("GET STARTED"),
                    const SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CovidPage()));
                      },
                      child: const Icon(Icons.arrow_forward),
                    ),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
