import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationView extends StatefulWidget {
  final double width;
  const NotificationView({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool isSelected = true;
  bool isMobile = false;
  bool isDesktop = false;

  Widget getNetwork(Image image, String hyperlink) {
    return InkWell(
      child: ClipOval(child: image),
      onTap: () => launch(hyperlink),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.fromLTRB(150, 50, 150, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SelectableText(
                    'Notifications',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SelectableText(
                      'We will always let you know about important changes, but you pick what you else want to hear about.'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 2,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 15, 0, 0),
                        child: Text(
                          'Enable Notifications\t\t\t\t',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: isSelected
                            ? Icon(
                                Icons.check_box,
                                color: Colors.green,
                              )
                            : Icon(Icons.check_box_outline_blank,
                                color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 15, 0, 0),
                        child: Text(
                          'Enable Mobile Notifications\t\t',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: isMobile
                            ? Icon(
                                Icons.check_box,
                                color: Colors.green,
                              )
                            : Icon(Icons.check_box_outline_blank,
                                color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isMobile = !isMobile;
                          });
                        },
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 2,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 15, 0, 0),
                        child: Text(
                          'Enable Desktop Notifications\t\t',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                        icon: isDesktop
                            ? Icon(
                                Icons.check_box,
                                color: Colors.green,
                              )
                            : Icon(Icons.check_box_outline_blank,
                                color: Colors.black),
                        onPressed: () {
                          setState(() {
                            isDesktop = !isDesktop;
                          });
                        },
                      ),
                    ],
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 15),
                  //   height: 2,
                  //   color: Colors.grey[300],
                  // ),
                  Row(
                    children: <Widget>[
                      Spacer(),
                      RaisedButton(
                          onPressed: () {},
                          child: Text(
                            'Save Changes',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.red[900]),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.fromLTRB(150, 35, 150, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SelectableText(
                    'Contact Us',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SelectableText(
                      'Here are some ways to reach out us on other platforms'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey,
                    height: 2,
                  ),
        
                  SizedBox(height: 207/2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      getNetwork(Image.asset('images/website.jpg',width: 100,height: 100,), 'https://www.ivlabs.in/'),
                      getNetwork(Image.asset('images/email.png',width: 100,height: 100,), 'ivlabs@mec.vnit.ac.in'),
                      getNetwork(Image.asset('images/facebook.jpg',width: 120,height: 120,), 'https://www.facebook.com/ivlabs/'),
                      getNetwork(Image.asset('images/github.jpg',width: 120,height: 120,), 'https://github.com/IVLABS'),
                      getNetwork(Image.asset('images/youtube.jpeg',width: 100,height: 100,), 'https://www.youtube.com/channel/UC2Ud1ZH23JJvmnb6aHCu51g'),
                      getNetwork(Image.asset('images/linkedin.png',width: 100,height: 100,), 'https://www.linkedin.com/company/ivlabs-vnit/?originalSubdomain=in'),
                    ],
                  ),
                  SizedBox(height: 207/2,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
