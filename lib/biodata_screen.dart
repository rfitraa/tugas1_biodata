import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class BiodataScreen extends StatelessWidget {
  final double coverHeight = 240;
  final double profileHeight = 120;

  const BiodataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[buildTop(), buildContent()],
    ));
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(margin: EdgeInsets.only(bottom: bottom), child: coverImage()),
        Positioned(top: top, child: profileImage())
      ],
    );
  }

  Widget coverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://images.unsplash.com/photo-1688993536536-df108751b415?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget profileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('assets/profile-pic.png'),
      );

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Rabiatul Fitra Aulia',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Politenik Negeri Malang',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 194, 194, 194)),
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          const Divider(),
          const SizedBox(
            height: 16,
          ),
          buildAbout(),
          const SizedBox(
            height: 32,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Let's Connect",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialButton(FontAwesomeIcons.instagram,
                  'https://www.instagram.com/tatarflia'),
              const SizedBox(width: 12),
              buildSocialButton(
                  FontAwesomeIcons.github, 'https://github.com/rfttra'),
              const SizedBox(width: 12),
              buildSocialButton(FontAwesomeIcons.linkedin,
                  'https://www.linkedin.com/in/rabiatul-fitra-aulia-9096a3205/'),
            ],
          ),
          const SizedBox(height: 32),
        ],
      );

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tentang Saya',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Saya adalah mahasiswa aktif di program studi Teknik Informatika, Politeknik Negeri Malang. Kegiatan saya saat ini adalah belajar dan mengikuti beberapa kegiatan dengan rasa ingin tahu yang tinggi dan mencari berbagai macam pengalaman baik di dalam maupun di luar kampus. Saya memiliki minat untuk belajar dan tertarik pada bidang Mobile Development.',
              textAlign: TextAlign.center,
            )
          ],
        ),
      );

  Widget buildSocialButton(IconData icon, String url) {
    return GestureDetector(
      onTap: () {
        launchURL(url);
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: const Color.fromARGB(255, 218, 181, 151),
        child: Icon(
          icon,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
