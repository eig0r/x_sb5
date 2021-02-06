part of sign_up_view;

class _SignUpMobile extends StatefulWidget {
  final SignUpViewModel viewModel;

  _SignUpMobile(this.viewModel);
  @override
  _SignUpMobileState createState() => _SignUpMobileState();
}

class _SignUpMobileState extends State<_SignUpMobile> {
  bool _isVisible = false;

  final formKey = new GlobalKey<FormState>();
  String language1 = '';
  String phoneNo, verificationId, smsCode;
  String userEnterName;
  String homenursing = '';
  bool codeSent = false;
  String welcome = '';
  String readme = '';
  String bcontinue = '';
  String valiednumber;
  String enterphone;
  String entername;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Visibility(
                      visible: !_isVisible,
                      child: Text(welcome,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                              fontSize: 18.0)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Image(
                    image: new AssetImage(
                      "assets/images/sb5.png",
                    ),
                    height: 170.0,
                    width: 170.0,
                  ),
                  Center(
                    child: Text(homenursing,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18.0,
                            color: Colors.black)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        // decoration: InputDecoration(hintText: 'Enter phone number'),
                        decoration: InputDecoration(
                          hintText: 'Enter Phone Number',
                          prefixIcon: Icon(Icons.mobile_screen_share),
                        ),
                        onChanged: (val) {
                          setState(() {
                            this.phoneNo = val;
                          });
                        },
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Enter Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                        onChanged: (val) {},
                      )),
                  codeSent
                      ? Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.0, right: 25.0, bottom: 25),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText:
                                          '       you will get code via sms'),
                                  onChanged: (val) {
                                    setState(() {
                                      this.smsCode = val;
                                    });
                                  },
                                )),
                            Container(
                              child: Column(
                                children: [
                                  Text('Resend SMS after'),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 5.0,
                                      bottom: 5.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Visibility(
                        visible: !_isVisible,
                        child: RaisedButton(
                            child: Center(
                              child: Text(bcontinue,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontSize: 18.0)),
                            ),
                            color: Colors.teal[300],
                            onPressed: () {
                              if (phoneNo != null && phoneNo.length == 11) {
                                setState(() {
                                  _isVisible = !_isVisible;
                                });

                                codeSent
                                    ? AuthenticationService()
                                        .signInWithOTP(smsCode, verificationId)
                                    : verifyPhone('+2' + phoneNo);
                              } else
                                showDialog(
                                    child: new Dialog(
                                      child: Container(
                                        height: 50.0,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 5),
                                        padding: EdgeInsets.all(8),
                                        child: Container(
                                          child: new Column(
                                            children: <Widget>[
                                              new Text('Enter Valied Number'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    context: context);
                            }),
                      )),
                  Visibility(
                    visible: !_isVisible,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: new RichText(
                        text: new TextSpan(
                          text: readme,
                          style: new TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(4, 4),
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(.9),
                    ),
                    BoxShadow(
                      offset: Offset(-3, 0),
                      blurRadius: 15,
                      color: Colors.grey.withOpacity(.1),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthenticationService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

  Future<void> signIn(String smsCode) async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      Navigator.of(context).pushReplacementNamed('/loginpage');
    }).catchError((e) {
      print(e);
    });
  }
}
