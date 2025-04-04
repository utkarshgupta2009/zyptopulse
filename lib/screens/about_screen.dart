import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              
            Text(
              'Welcome to Weframe Tech',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Building websites that place you in the top 1% of the digital world.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

              
            Text(
              'Our Mission',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'We are on a mission to help Direct-to-Consumer (D2C) founders move away from traditional Shopify sites and embrace scalable, automated headless commerce solutions.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

              
            Text(
              'Our Journey',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Our journey started as we faced challenges with our first startup venture. To sustain ourselves, we shared our tech expertise, kickstarting Weframe Tech\'s consulting services under the guidance of our CTO, Sambit Majhi.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'As word spread about our consulting services, we shifted our focus to building affordable apps and websites, learning valuable lessons along the way.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

              
            Text(
              'Expertise & Achievements',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Our specialization evolved towards assisting D2C brands in establishing headless e-commerce solutions and B2B SaaS solutions with headless architecture.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'With a team of over 20+ dedicated professionals and a track record of over 200+ successful projects, we have collaborated with prestigious global brands.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

              
            Divider(),
            Center(
              child: Column(
                children: [
                  Text('© 2025 All Rights Reserved', style: TextStyle(fontSize: 14.0)),
                  SizedBox(height: 4.0),
                  Text('Powered by Directus', style: TextStyle(fontSize: 14.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


