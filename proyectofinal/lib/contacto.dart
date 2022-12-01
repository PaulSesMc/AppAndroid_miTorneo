import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  _textMe() async {
    // Android
    const uri = 'sms:+39 348 060 888?body=hello%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
        throw 'Could not launch $uri';
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
                                  onPressed: _textMe,
                                  child: const Text('SMS',style: TextStyle(fontSize: 20.0),),
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
                                    openwhatsapp(mensaje, destinatario);
                                  },
                                ),
                              ],
                            ),
                          ])
                    ]))));
  }
}


