import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mywebapp/constants.dart';
import 'package:mywebapp/widgets/AppBarWidget.dart';
import 'package:url_launcher/url_launcher.dart';

class dMyAppDescription extends StatefulWidget {
  static const String id = "dappDes";
  const dMyAppDescription({Key? key}) : super(key: key);

  @override
  State<dMyAppDescription> createState() => _dMyAppDescriptionState();
}

class _dMyAppDescriptionState extends State<dMyAppDescription> {
  bool isDark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(),
      ),
      body: Center(
        child: Column(
          children: [
            Text(MyConstants.ISLTDescription),
            GestureDetector(
              onTap: (){
                launch(Uri.encodeFull('https://bit.ly/indianslt'));
              },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FaIcon(FontAwesomeIcons.googlePlay,color: Colors.white,),
                        SizedBox(width: 8.0,),
                        Text("Get on Google Play",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
}
