import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class WorkerDetailsScreen extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final String job;
  final String jobTitle;

  const WorkerDetailsScreen({
    super.key,
    required this.name,
    required this.image,
    required this.color,
    required this.job,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          color: color.withOpacity(0.12),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            job,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(Icons.add, color: Colors.black, size: 25),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.1,
                              blurRadius: 2,
                              offset: Offset(0, 5),
                            ),
                          ]),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    jobTitle,
                    style: TextStyle(color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                 Padding(
                   padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                   child: Text("Professional skills: \n— Programming in Delphi, Java,"
                       " PHP, C++;\n— Knowledge of document markup languages "
                       "(websites): HTML, CSS, Javascript (JS); \n— Ability to "
                       "write structured and understandable code;\n— Understanding"
                       " the principles and stages of web project development;\n— "
                       "Experience writing and working with TK;\n— Ability to find "
                       "effective solutions, work for results;\n— Ability to work "
                       "with a large amount of information;"),
                 )
                ],
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.60,
                builder: (context, scrollController) {
                  return Container(
                    padding: EdgeInsets.only(top: 40, right: 20, left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Text(
                          "Stats",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            iconContainer(
                              Colors.redAccent,
                              Ionicons.heart,
                              "likes",
                              43,
                            ),
                            iconContainer(
                              Colors.deepPurpleAccent.withOpacity(0.5),
                              AntDesign.like1,
                              "thanks",
                              26,
                            ),
                            iconContainer(
                              Colors.blue,
                              Ionicons.ribbon,
                              "credits",
                              18,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Last Updates",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        lastUpdates(
                            name,
                            "General",
                            "done great job when meeting newcomers in the office "
                                "yesterday. I\'m proud of him."),
                        SizedBox(height: 20),
                        lastUpdates(
                            name,
                            "Attitude",
                            "took the extra effort to "
                                "help me with my project last week. He\'s five star teamlead!"),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget lastUpdates(String name, String title, String desc) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.07),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              desc,
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconContainer(Color color, IconData icon, String title, int number) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.06),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 40),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number.toString(),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
