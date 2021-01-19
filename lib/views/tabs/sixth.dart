import 'package:bookshelf_app/widgets/subject.dart';
import 'package:flutter/material.dart';

class Sixth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.0,
              ),
              Text(
                " First Semister",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Subject(
                      title: "Communication Nepali",
                    ),
                    Subject(
                      title: "Communication English",
                    ),
                    Subject(
                      title: "Enginnering Mathmatics",
                    ),
                    Subject(
                      title: "Engineering Physics I",
                    ),
                    Subject(
                      title: "Engineering Chemistry",
                    ),
                    Subject(
                      title: "Computer Fundamental",
                    ),
                    Subject(
                      title: "Programming C",
                    ),
                  ],
                ),
              ),
              Text(
                " Second Semister",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Subject(
                      title: "Engineering Mathematics II",
                    ),
                    Subject(
                      title: "Engineering Physics II",
                    ),
                    Subject(
                      title: "Engineering Chemistry II ",
                    ),
                    Subject(
                      title: "Digital Logic",
                    ),
                    Subject(
                      title: "C++",
                    ),
                    Subject(
                      title: " Electrical Engineering",
                    ),
                    Subject(
                      title: "Web Technology & Programming I",
                    ),
                  ],
                ),
              ),
              Text(
                " Third Semister",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Subject(
                      title: "Web II",
                    ),
                    Subject(
                      title: "Engineering Mathematics III",
                    ),
                    Subject(
                      title: "DSA",
                    ),
                    Subject(
                      title: "DMS",
                    ),
                    Subject(
                      title: "Microprocessors",
                    ),
                    Subject(
                      title: "EDC",
                    ),
                  ],
                ),
              ),
              Text(
                " Fourth Semister",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Subject(
                      title: "Data Communication",
                    ),
                    Subject(
                      title: "System Analysis & Design",
                    ),
                    Subject(
                      title: "Visual programming",
                    ),
                    Subject(
                      title: "Computer Architecture",
                    ),
                    Subject(
                      title: "Computer Repair & MaintenanceI",
                    ),
                    Subject(
                      title: "Computer Graphics",
                    ),
                    Subject(
                      title: "Statistics & Probability",
                    ),
                  ],
                ),
              ),
              Text(
                " Fifth Semister",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Subject(
                      title: "Computer Networks",
                    ),
                    Subject(
                      title: "Management Information System",
                    ),
                    Subject(
                      title: "Applied Telecommunication",
                    ),
                    Subject(
                      title: "Applied Telecommunication",
                    ),
                    Subject(
                      title: "Operating System",
                    ),
                    Subject(
                      title: "Cyber security and social ethic",
                    ),
                    Subject(
                      title: "Simulation and Modeling",
                    ),
                  ],
                ),
              ),
              Text(
                " Sixth Semister",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Subject(
                      title: "Multimedia Technology",
                    ),
                    Subject(
                      title: "Internet Technology",
                    ),
                    Subject(
                      title: "Data Mining",
                    ),
                    Subject(
                      title: "Software Engineering",
                    ),
                    Subject(
                      title: "E-commerce",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
