import 'package:flutter/material.dart';

class CareerPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("career path"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title("Learning Path: Entry Level"),
                  subTitle("Certification Exams:"),
                  dis("CompTIA IT Fundamentals  \nCompTIA A+ Core 2019 \nMicrosoft MTA: Windows OS, Exam 98-349  \nMicrosoft MTA: Security, Exam 98-367 \nMicrosoft MTA: Cloud, Exam 98-369 \nMicrosoft MTA: Networking, Exam 98-366ITIL Foundation"),
                  subTitle("Additional Skills:"),
                  dis("End User Security Awareness \nLinux for Beginners \nPC Maintenance \nBuilding a PC \nCloud Fundamentals"),
                  title("Learning Path: Desktop Support"),
                  subTitle("Novice:"),
                  dis("CompTIA IT Fundamentals \nCompTIA A+ Core 2019 \nMicrosoft MTA: Windows OS, Exam 98-349 \nACA Mac Management Basics 10.11 \nACA Mac Integration Basics 10.13"),
                  subTitle("Advance:"),
                  dis("CompTIA Network+: Exam N10-007 \nMicrosoft MCSA Windows 10, Exam 70-697 \nMicrosoft MCSA Windows 10, Exam 70-698 \nMicrosoft MCSA Windows Server 2012,Exam 70-410\nMicrosoft MCSA Windows Server 2012, Exam 70-411\nMicrosoft MCSA Windows Server 2012, Exam 70-412 \nMicrosoft MCSA Windows Server 2016, Exam 70-740 \nMicrosoft MCSA Windows Server 2016, Exam 70-741\nMicrosoft MCSA Windows Server 2016, Exam 70-742 \nACSP macOS Support Essentials 10.13"),
                  title("Learning Path: System Administration"),
                  subTitle("Novice: "),
                  dis("CompTIA IT Fundamentals\nCompTIA A+ Core 2019 \nMTA - Windows Operating System Fundamentals - 98-349"),
                  subTitle("Intermediate:"),
                  dis("CompTIA Network+  \nMicrosoft Office 365 - 70-346 \nMicrosoft Office 365 - 70-347 \nMicrosoft MCSA Windows Server 2016,  Exam 70-740 \nMicrosoft MCSA Windows Server 2016, Exam 70-741\nMicrosoft MCSA Windows Server 2016, Exam 70-742\nSharePoint 2016 - 70-339\nCompTIA Server+ \nCompTIA Linux+"),
                  subTitle("Advanced: "),
                  dis("Microsoft Exchange 2013 - 70-341 \nMicrosoft Exchange Server 2016 - 70-345 \nSystem Center 2012 Configuration Manager - 70-243\nAdvanced SharePoint 2016 - 70-339 \nMCSE Windows Server 2016 - 70-744"),
                  title("Learning Path: Network Technology"),
                  subTitle("Novice:"),
                  dis("CompTIA IT Fundamentals \nCompTIA A+ Core 2019\nCCENT \nMTA - Networking Fundamentals - 98-366"),
                  subTitle("Intermediate: "),
                  dis("CompTIA Network+ (N10-007) \nCompTIA Security+ \nCCNA Routing and Switching\nCCNA Security \nCompTIA Linux+ \nMicrosoft MCSA Windows Server 2016, Exam 70-740\nMicrosoft MCSA Windows Server 2016, Exam 70-741 \nMicrosoft MCSA Windows Server 2016, Exam 70-742"),
                  subTitle("Advanced:"),
                  dis("CCNP Routing and Switching - ROUTE \nCCNP Routing and Switching - SWITCH \nCCNP Routing and Switching - TSHOOT \nCompTIA Advanced Security Practitioner \nCisco ASA Express Security \nFirePOWER with Advanced FireSIGHT Administration  \nMCSE Windows Server 2016 - 70-744"),
                  title("Learning Path: Cloud Technology"),
                  subTitle("Novice:"),
                  dis("CompTIA IT Fundamentals\nCompTIA Network+ (N10-007) \nMTA - Cloud Fundamentals - 98-369"),
                  subTitle("Intermediate:"),
                  dis("AWS Certified Cloud Practitioner\nAWS Certified Solutions Architect - Associate\nAWS Certified SysOps Administrator – Associate\nAWS Certified Developer – Associate\nMCSA Windows Server 2016 - 70-740\nMCSA Windows Server 2016 - 70-741\nMCSA Windows Server 2016 - 70-742"),
                  subTitle("Advanced:"),
                  dis("MCSE Windows Server 2012 - 70-413\nMCSE Windows Server 2012 - 70-414\nMCSE Windows Server 2016 - 70-744\nMCSE Private Cloud - 70-246\nMCSE Private Cloud - 70-247"),
                  subTitle("Expert:"),
                  dis("Certified Cloud Security Professional\nAWS Certified DevOps Engineer – Professional\nAmazon Certified Big Data – Specialty"),
                  title("Learning Path: Virtualization Technology"),
                  subTitle("Novice:"),
                  dis("CompTIA IT Fundamentals\nVirtualization Technologies: Fundamentals of Virtualization\nCompTIA A+ Core 2019\nCompTIA Network+\nCompTIA Server+"),
                  subTitle("Intermediate:"),
                  dis("Microsoft MCSA Windows Server 2016, Exam 70-740\nMicrosoft MCSA Windows Server 2016, Exam 70-741\nMicrosoft MCSA Windows Server 2016, Exam 70-742\nCitrix XenServer 7.0\nVMware Certified Associate 6 VCA6-DCV"),
                  title("Learning Path: Cybersecurity"),
                  subTitle("Novice:"),
                  dis("CompTIA IT Fundamentals\nCompTIA A+ Core 2019\nMTA - Networking Fundamentals - 98-366\nMTA - Security Fundamentals - 98-367"),
                  subTitle("Intermediate: "),
                  dis("CompTIA CySA+ (CS0-001)\nCompTIA Security+\nCompTIA Network+ (N10-007)\nECES\nCEH v10\nCHFI v9\nCompTIA Linux+\nCCNA Routing and Switching\nCCNA Security (2018)\nGSEC"),
                  subTitle("Advanced:"),
                  dis("CompTIA Advanced Security Practitioner (2016)\nCISA\nCyberSec First Responder\nCCNA Cyber Ops (210-250 SECFND)\nCCNA Cyber Ops (210-255 SECOPS)\nSystems Security Certified Practitioner"),
                  subTitle("Expert:"),
                  dis("CISM\nCertified Information Systems Security Professional\nCertified Cloud Security Professional"),
                  title("Learning Path: Database Administration"),
                  subTitle("Novice:"),
                  dis("CompTIA IT Fundamentals \nCompTIA A+ Core 2019 \nRelational Database Design"),
                  subTitle("Intermediate:"),
                  dis("CompTIA Server+\nMicrosoft Exchange Server 2016 – 70-345\nMicrosoft SQL Server 2014 - 70-461\nMicrosoft SQL Server 2012 - 70-462"),
                  title("Learning Path: IT Management Strategy:"),
                  subTitle("Novice:"),
                  dis("CompTIA Project+\nAccredited ITIL 4 Foundation\nLean Six Sigma - Yellow Belt\nLean Six Sigma - Green Belt\nLean Agile Project Managem\nAccredited Prince2 2017 Foundation\nAccredited ISO/IEC 20000:2011\nAccredited SIAM Foundation"),
                  subTitle("Intermediate:"),
                  dis("Accredited ITIL Intermediate - RCV\nAccredited ITIL Intermediate - OSA\nAccredited ITIL Intermediate - PPO\nAccredited ITIL Intermediate - SOA\nAccredited ITIL Intermediate - Service Design\nAccredited ITIL Intermediate - Service Operation\nAccredited ITIL Intermediate - Service Strategy\nAccredited ITIL Intermediate - Service Transition\nAccredited ITIL Intermediate - CSI\nPMI: Organizational Change Managemen\nAccredited Agile Project Management Concepts "),
                  subTitle("Advanced:"),
                  dis("Accredited ITIL - Practitioner\nProject Management Professional 6"),
                  subTitle("Expert:"),
                  dis("Accredited ITIL Expert - MALC\nAccredited Prince2 2017 Practitioner\nHow To Become an ITIL Master"),
                  title("Learning Path: Development"),
                  subTitle("Novice:"),
                  dis("Abstracting with Functions\nAlgorithmic Problem Solving\nApplied Fundamentals: Guess the Number\nApplied Fundamentals: Hangma\nGetting Technical with the Terminal\nHTML, CSS and Bootstrap\nHTML5 Canvas Graphics and Animations\nIntro to Web Development\nIntro to JavaScript\nPython Programming\nIntro to Docker\nIntro to Git\nIntro to NodeJS\nIntro to NumPy\nIntro to Vue.js\nIntro to AngularJS\nIntro to Webpack\nIntro to PHP"),
                  subTitle("Intermediate:"),
                  dis("Intro to Redux\nIntro to Ruby on Rails\nObject Oriented Python\nObject Oriented Java\nPython for Security\nWeather Application with Angular Express\nRESTful API with Express\nChat App with React and Firebase"),
                ],
              ),
            ]),
          )),
    );
  }

  Widget title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget subTitle(String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        subtitle,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black.withOpacity(0.5),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget dis(String dis) {
    return Text(
      dis,
      style: TextStyle(fontSize: 17.0),
    );
  }
}
