import 'package:flutter/material.dart';
import '../data/app_localizattions.dart';

class AboutTheAppScreen extends StatelessWidget {
  const AboutTheAppScreen({Key? key}) : super(key: key);
  static const routeName = "/about-the-app";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.translate('about'),
        ),
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          alignment: Alignment.center,
          child: DefaultTextStyle(
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
            child: Column(children: [
              Text(
                AppLocalizations.of(context)!.translate('line1'),
              ),
              const Text(
                "discovertunisia.com",
                style: TextStyle(color: Colors.redAccent),
              ),
              Text(
                AppLocalizations.of(context)!.translate('line2'),
              ),
              const Divider(
                height: 100,
              ),
              Image.asset(
                "assets/images/tunisia.png",
                height: 150,
              ),
              const Divider(
                height: 100,
              ),
              const Text("Made with "),
              const Icon(Icons.favorite, color: Colors.red),
              const Text("by Flutter Pro")
            ]),
          ),
        ),
      ),
    );
  }
}
