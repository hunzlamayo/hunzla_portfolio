import 'package:flutter/material.dart';

void main() => runApp(NewPortfolioApp());

class NewPortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black54),

        ),
      ),
      home: PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Portfolio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/new_profile.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Software Engineer | Flutter Enthusiast',
                style: TextStyle(fontSize: 16, color: Colors.teal),
              ),
              SizedBox(height: 30),
              PortfolioSection(
                title: 'About Me',
                content:
                    'I am a passionate developer with experience in Flutter and other mobile technologies. I love creating elegant and user-friendly applications.',
              ),
              PortfolioSection(
                title: 'Skills',
                child: Column(
                  children: [
                    SkillWidget(skillName: 'Flutter', level: 0.9),
                    SkillWidget(skillName: 'Dart', level: 0.8),
                    SkillWidget(skillName: 'UI/UX Design', level: 0.7),
                  ],
                ),
              ),
              PortfolioSection(
                title: 'Projects',
                child: Column(
                  children: [
                    ProjectCard(
                      projectName: 'E-Commerce App',
                      description: 'A full-featured shopping app with payment integration.',
                    ),
                    ProjectCard(
                      projectName: 'Task Manager',
                      description: 'A productivity app for task tracking and reminders.',
                    ),
                  ],
                ),
              ),
              PortfolioSection(
                title: 'Contact Me',
                child: Column(
                  children: [
                    ContactInfo(icon: Icons.email, info: 'john.doe@example.com'),
                    ContactInfo(icon: Icons.phone, info: '+123 456 7890'),
                    ContactInfo(icon: Icons.location_on, info: 'San Francisco, CA'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? child;

  PortfolioSection({required this.title, this.content, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          SizedBox(height: 10),
          if (content != null)
            Text(
              content!,
              style: TextStyle(fontSize: 16),
            ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

class SkillWidget extends StatelessWidget {
  final String skillName;
  final double level;

  SkillWidget({required this.skillName, required this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skillName, style: TextStyle(fontSize: 16)),
              Text('${(level * 100).toInt()}%',
                  style: TextStyle(color: Colors.teal)),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: level,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String projectName;
  final String description;

  ProjectCard({required this.projectName, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              projectName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String info;

  ContactInfo({required this.icon, required this.info});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(info),
    );
  }
}
