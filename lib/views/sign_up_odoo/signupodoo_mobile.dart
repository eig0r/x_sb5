part of splash_view;

// ignore: unused_element
class _SignupOdooMobile extends StatefulWidget {
  final SignupOdooViewModel viewModel;

  _SignupOdooMobile(this.viewModel);

  @override
  __SignupOdooMobileState createState() => __SignupOdooMobileState();
}

class __SignupOdooMobileState extends Base<_SignupOdooMobile> {
  String odooURL = 'https' + "://" + 'storedemo.portsaid.life';
  // String _selectedProtocol = "http";
  // String _selectedDb;
  String _email;
  String _pass;
  // List<String> _dbList = [];
  List dynamicList = [];
  bool isCorrectURL = false;
  bool isDBFilter = false;
//  TextEditingController _urlCtrler = new TextEditingController();
  TextEditingController _emailCtrler = new TextEditingController();
  TextEditingController _passCtrler = new TextEditingController();

  _checkFirstTime() {
    isConnected().then((isInternet) {
      if (isInternet) {
        showLoading();
        // Init Odoo URL when URL is not saved
        odoo = new Odoo(url: odooURL);
        odoo.getDatabases().then((http.Response res) {
          setState(
            () {
              hideLoadingSuccess("Odoo Server Connected");
              isCorrectURL = true;
              dynamicList = json.decode(res.body)['result'] as List;
              saveOdooUrl(odooURL);
            },
          );
        }).catchError(
          (e) {
            showMessage("Warning", "Invalid URL");
          },
        );
      }
    });
  }

  _login() {
    if (isValid()) {
      isConnected().then((isInternet) {
        if (isInternet) {
          showLoading();

          odoo.authenticate(_email, _pass, 'storedemo').then(
            (http.Response auth) {
              widget.viewModel.NaviToView();
              if (auth.body != null) {
                User user = User.fromJson(jsonDecode(auth.body));
                if (user != null && user.result != null) {
                  print(auth.body.toString());
                  hideLoadingSuccess("Logged in successfully");
                  saveUser(json.encode(user));
                  saveOdooUrl(odooURL);
                  widget.viewModel.NaviToView();
                } else {
                  showMessage("Authentication Failed",
                      "Please Enter Valid Email or Password");
                }
              } else {
                showMessage("Authentication Failed",
                    "Please Enter Valid Email or Password");
              }
            },
          );
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getOdooInstance().then((odoo) {
      _checkFirstTime();
    });
  }

  bool isValid() {
    _email = _emailCtrler.text;
    _pass = _passCtrler.text;
    if (_email.length > 0 && _pass.length > 0) {
      return true;
    } else {
      showSnackBar("Please enter valid email and password");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginwidget = Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailCtrler,
            decoration: InputDecoration(
              labelText: "E-mail",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: TextField(
            controller: _passCtrler,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(15),
          // ignore: deprecated_member_use
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              _login();
            },
            padding: EdgeInsets.all(12),
            color: Colors.green,
            child: Text(
              'N e x t',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat",
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      key: scaffoldKey,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                  ),
                  Center(
                    child: Text('SB5 ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 36.0,
                            color: Colors.black54)),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Text('SplashMobile'),
                      onLongPress: widget.viewModel.NaviToView,
                    ),
                  ),
                  SizedBox(
                    height: 120,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text('SB5',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Colors.green)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  ),
                  loginwidget,
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
      floatingActionButton: isLoggedIn()
          ? FloatingActionButton(
              child: Icon(Icons.settings),
              onPressed: () {
                //  pushReplacement(Settings());
              },
            )
          : SizedBox(height: 0.0),
    );
  }
}
