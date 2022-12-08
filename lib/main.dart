import 'package:covid_app/model/covid_api_model.dart';
import 'package:covid_app/screen_one.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeCovid(),
    );
  }
}

class CovidPage extends StatefulWidget {
  const CovidPage({super.key});

  @override
  State<CovidPage> createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  var data;
  bool loading = true;
  bool show = false;
  late CovidModel myModel;
  getDatafromApi() async {
    final responce =
        await http.get(Uri.parse("https://api.covid19api.com/summary"));

    if (responce.statusCode == 200) {
      print(responce.statusCode);
      var body = jsonDecode(responce.body);
      data = body['Global'];
      setState(() {
        // print("running");
        myModel = CovidModel(
          NewConfirmed: data['NewConfirmed'].toString(),
          TotalConfirmed: data['TotalConfirmed'].toString(),
          NewDeaths: data['NewDeaths'].toString(),
          TotalDeaths: data['TotalDeaths'].toString(),
        );

        loading = false;
      });
    }
  }

  @override
  void initState() {
    loading = true;
    getDatafromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [
                  CircleAvatar(backgroundImage: AssetImage("img/User.png"))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .2,
                    width: MediaQuery.of(context).size.width * .8,
                    color: const Color(0xffCFE3FC),
                    child: Row(
                      children: [
                        const Image(image: AssetImage("img/Design.png")),
                        const SizedBox(
                          width: 30,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .100,
                          width: MediaQuery.of(context).size.width * .3,
                          child: const Text(
                            "Know safety tips and precautions from top Doctors.",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xffF49E6F)),
                    height: 60,
                    width: MediaQuery.of(context).size.width * .8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          height: 40,
                          width: MediaQuery.of(context).size.width * .3,
                          child: const Text("Tracker",
                              textAlign: TextAlign.center),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 40,
                          width: MediaQuery.of(context).size.width * .3,
                          child: const Text("Symptoms",
                              style: TextStyle(color: Color(0xffA74813)),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              loading == true
                  ? const SizedBox(
                      height: 100,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color(0xffFC1441).withOpacity(.1),
                                    borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * .16,
                                width: MediaQuery.of(context).size.width * .3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Confirmed",
                                      style: TextStyle(
                                          color: Color(0xffFC1441),
                                          fontSize: 17),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          myModel.NewConfirmed,
                                          style: const TextStyle(
                                              color: Color(0xffFC1441),
                                              fontSize: 25),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color(0xff157FFB).withOpacity(.1),
                                    borderRadius: BorderRadius.circular(15)),
                                height:
                                    MediaQuery.of(context).size.height * .16,
                                width: MediaQuery.of(context).size.width * .3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Death",
                                      style: TextStyle(
                                          color: Color(0xff157FFB),
                                          fontSize: 17),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          myModel.NewDeaths,
                                          style: const TextStyle(
                                              color: Color(0xff157FFB),
                                              fontSize: 25),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color(0xff30A64A).withOpacity(.1),
                                    borderRadius: BorderRadius.circular(15)),
                                margin: const EdgeInsets.all(10),
                                height:
                                    MediaQuery.of(context).size.height * .16,
                                width: MediaQuery.of(context).size.width * .3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Latest",
                                      style: TextStyle(
                                          color: Color(0xff30A64A),
                                          fontSize: 17),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          myModel.NewConfirmed,
                                          style: const TextStyle(
                                              color: Color(0xff30A64A),
                                              fontSize: 25),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .16,
                                width: MediaQuery.of(context).size.width * .3,
                                decoration: BoxDecoration(
                                    color:
                                        const Color(0xff6D757D).withOpacity(.1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Total Death",
                                      style: TextStyle(
                                          color: Color(0xff6D757D),
                                          fontSize: 17),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          myModel.TotalDeaths,
                                          style: const TextStyle(
                                              color: Color(0xff6D757D),
                                              fontSize: 25),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Text(
                    "All List",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffCFE3FC),
                ),
                height: 70,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "Date",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "Latest",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "Confirmed",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "NewDeath",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "Total Death",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffCFE3FC),
                ),
                height: 70,
                width: double.infinity,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color(0xffCFE3FC),
                ),
                height: 70,
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
