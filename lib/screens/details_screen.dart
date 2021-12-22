import 'package:flutter/material.dart';
import '../data/app_localizattions.dart';
import '../data/images.dart';
import '../models/destination.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const routeName = "/details";
  @override
  Widget build(BuildContext context) {
    final des = ModalRoute.of(context)!.settings.arguments as Destination;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(des.name),
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pics[des.img]![0]),
                ),
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                          horizontal:
                              BorderSide(color: Colors.white, width: 3)),
                      color: Color.fromRGBO(63, 43, 44, 0.8),
                    ),
                    height: size.height * 0.25,
                    padding: const EdgeInsets.all(5),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate('transport'),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              des.transport,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(color: Colors.white, width: 3)),
                          color: Color.fromRGBO(180, 48, 71, 0.8),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Text(
                            AppLocalizations.of(context)!.translate('good'),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              des.goodToKnow,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ]))),
                  ),
                  const Divider(),
                  Container(
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                            horizontal:
                                BorderSide(color: Colors.white, width: 3)),
                        color: Color.fromRGBO(1, 73, 94, 0.8),
                      ),
                      padding: const EdgeInsets.all(5),
                      height: size.height * 0.25,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context)!
                                  .translate('shopping'),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                des.shopping,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ));
  }
}
