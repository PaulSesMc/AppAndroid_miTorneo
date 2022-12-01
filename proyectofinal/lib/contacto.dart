import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';

class Contacto extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Contacto> {
  openwhatsapp(String message, String destinatario) async {
    var whatsapp = destinatario;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=" + message;
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";

    // android , web
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("whatsapp no installed")));
    }
  }


  _launchWhatsapp() async {
    var whatsapp = "+91XXXXXXXXXX";
    var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
    if (await canLaunchUrl(whatsappAndroid)) {
        await launchUrl(whatsappAndroid);
    } else {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
}


  Future<void> _launchUrl() async {
    var _url = Uri.parse("sms:966738292?body=hello%20there");
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
                margin: EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Ponte en contacto con nosotros\n',
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        '\nTu opinión es muy importante para nosotros. Si tienes algún comentario o sugerencia ponte en contacto con nosotros:\n',
                        //style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.justify,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.grey,
                                  ),
                                  onPressed: _launchUrl,
                                  child: const Text(
                                    'SMS',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                TextButton(
                                  child: Text(
                                    'Whatsapp',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.grey,
                                  ),
                                  onPressed: () {
                                    String mensaje = "Hola Mcdonalds";
                                    String destinatario = "+525559175602";
                                    //openwhatsapp(mensaje, destinatario);
                                    _launchWhatsapp();
                                  },
                                ),
                              ],
                            ),
                          ])
                    ]))));
  }
}
