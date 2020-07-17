import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  num selectedRadiobutton;
  
  void changeInstallationLocation(num val) {
    setState(() {
      selectedRadiobutton = val;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedRadiobutton = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: MediaQuery.of(context).size.height,
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image(
                    image: AssetImage('images/falcon.png'),
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SelectableText(
                  'Sign Up',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                SelectableText(
                  'Let\'s move to next step',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SelectableText.rich(
                  TextSpan(
                    text: 'Steps: ',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                        text: '2 out of 4',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SelectableText(
                        'Where is system installed ?',
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
                      ),
                    ),
                    Expanded(child: Container(),),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                RadioListTile(
                  value: 1,
                  groupValue: 1,
                  title: Text('College / Institution'),
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    changeInstallationLocation(val);
                  },
                ),
                RadioListTile(
                  value: 2,
                  groupValue: 1,
                  title: Text('Society'),
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    changeInstallationLocation(val);
                  },
                ),
                RadioListTile(
                  value: 3,
                  groupValue: 1,
                  title: Text('Company / Industry'),
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    changeInstallationLocation(val);
                  },
                ),
                RadioListTile(
                  value: 4,
                  groupValue: 1,
                  title: Text('Others'),
                  activeColor: Colors.blue,
                  onChanged: (val) {
                    changeInstallationLocation(val);
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      'Next Step',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
