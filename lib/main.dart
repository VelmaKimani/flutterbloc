import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrazorpay/models/SevaName.dart';
import 'package:flutterrazorpay/bloc/sevadetail_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: BlocProvider(
            create: (context) => SevadetailBloc(),
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate;
  Razorpay _razorpay;

  List<SevaName> sevadetails = new List<SevaName>();

  // String value = 'usa'; Don't use value which doesn't exist in dropdown list
  String value; //Better to initialize with null

  String buttonvaluetext = '';

  String sevadetailtext = '', buttonvalue1 = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gothramController = TextEditingController();
  SevadetailBloc _sevadetailBloc;

  void _onnameChanged() {
    _sevadetailBloc.add(nameChanged(name: _nameController.text));
  }

  void _ongothramChanged() {
    _sevadetailBloc.add(gothramChanged(gothramname: _gothramController.text));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sevadetails.add(new SevaName('suprabatha', 'india', 234));
    sevadetails.add(new SevaName('thomala', 'germany', 123));
    sevadetails.add(new SevaName('rudhrabhishikam', 'newyork', 456));
    _sevadetailBloc = BlocProvider.of<SevadetailBloc>(context);
    _nameController.addListener(_onnameChanged);
    _gothramController.addListener(_ongothramChanged);
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }



  String buttonvalue() {
    for (var seva in sevadetails) {
      if (seva.sevaname == value) {
        buttonvaluetext = seva.sevavalue.toString();
        buttonvalue1 = buttonvaluetext;
        return buttonvalue1;
      }
    }
  }

  String sevatextdetail() {
    for (var seva in sevadetails) {
      if (seva.sevaname == value) {
        sevadetailtext = seva.sevadetail;
        return sevadetailtext;
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<SevadetailBloc, SevadetailState>(
      builder: (context, state) {
        //   if() {}
        // }
        return Column(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter your username'),
            ),
            TextFormField(
              controller: _gothramController,
              decoration: InputDecoration(labelText: 'Enter your gothram'),
            ),
            DropdownButton<String>(
              value: value, //Assign value
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String data) {
                // setState() {
                //   value = data;
                // }; Parenthesis was missing
                setState(() {
                  value = data;
                });
              },
              items:
              sevadetails.map<DropdownMenuItem<String>>((SevaName value) {
                return DropdownMenuItem<String>(
                  value: value.sevaname,
                  child: Text(value.sevaname),
                );
              }).toList(),
            ),
            DateField(
              selectedDate: selectedDate,
              onDateSelected: (DateTime date) {
                setState() {
                  selectedDate = date;
                }
              },
              lastDate: DateTime(2021),
            ),
            Text('Selected Item = ' + '$sevadetailtext',
                style: TextStyle(fontSize: 22, color: Colors.black)),
            MaterialButton(
              child: Text('$buttonvalue1'),
              shape: Border.all(width: 2.0, color: Colors.redAccent),
              onPressed: () {openCheckout();},
            ),
          ],
        );
      },
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Scaffold.of(context).showSnackBar(SnackBar(content:Text("SUCCESS: " + response.paymentId)));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Scaffold.of(context).showSnackBar(SnackBar(content:Text("ERROR: " + response.code.toString() + " - " + response.message,)));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Scaffold.of(context).showSnackBar(SnackBar(content:Text("EXTERNAL_WALLET: " + response.walletName)));
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_7Ie8SGczM1KO0d',
      'amount': 2000,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }
}