// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiasScreen extends StatelessWidget {
  final List<Map<String, String>> noticias = [
    {
      "titulo": "Searchlight Pictures Wins 5 Oscars",
      "resumen":
          "Searchlight Pictures won five awards during the 96th Oscars® Sunday,"
              'hosted by Jimmy Kimmel and broadcast live on ABC.'
              'Poor Things received four of those awards, while The Last Repair Shop received one.',
      "url":
          "https://thewaltdisneycompany.com/oscars-2024-searchlight-pictures-poor-things-the-last-repair-shop/"
    },
    {
      "titulo":
          "Disney and Pixar's 'Inside Out 2' Reveals New Trailer and Voice Cast",
      "resumen": "A new trailer and poster were released today for Disney and Pixar’s"
          'Inside Out 2, which welcomes new Emotions to now-teenager Riley’s mind. Directed by Kelsey Mann and produced by Mark Nielsen,'
          'with a score by Andrea Datzman, the animated feature film will release exclusively in theaters on Friday, June 14, 2024.',
      "url":
          "https://thewaltdisneycompany.com/disney-and-pixars-inside-out-2-reveals-new-trailer-and-voice-cast/"
    },
    {
      "titulo":
          "ICYMI: CEO Bob Iger Addresses Disney’s Strength, Growth, and Momentum",
      "resumen": "Disney Chief Executive Officer Bob Iger participated in a question-and-answer session at the Morgan Stanley Technology,'"
          'Media and Telecom Conference on Tuesday.'
          'The wide-ranging interview touched on multiple topics from across the enterprise,'
          'allowing Iger to reinforce that the significant fixing the company underwent following his return as CEO has set the stage for Disney to enter a new era of building to achieve strategic growth in its businesses."',
      "url":
          "https://thewaltdisneycompany.com/bob-iger-disney-morgan-stanley-conference/"
    },
  ];

  NoticiasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Últimas Noticias'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          final noticia = noticias[index];
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: Text(noticia["titulo"] ?? ""),
                  subtitle: Text(noticia["resumen"] ?? ""),
                  onTap: () async {
                    final url = noticia["url"];
                    if (url != null && await canLaunch(url)) {
                      await launch(url);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40, // Altura del logo
            ),
          ],
        ),
      ),
    );
  }
}
