import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterrazorpay/models/SevaName.dart';
import 'package:flutterrazorpay/bloc/sevadetail_bloc.dart';
import 'package:flutterrazorpay/repository/seva_bloc_repository.dart';

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
          child: BlocProvider(create: (context) => SevadetailBloc(),
          child: MyHomePage(),),
      ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate;

  List<SevaName> sevadetails = new List<SevaName>();

  String value = 'usa';

  String buttonvaluetext = '';

  String sevadetailtext = '',
      buttonvalue1 = '';


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
        if() {}
      }
        Column(
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  labelText: 'Enter your username'
              ),
            ),
            TextFormField(
              controller: _gothramController,
              decoration: InputDecoration(
                  labelText: 'Enter your gothram'
              ),
            ),
            DropdownButton<String>(
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String data) {
                setState() {
                  value = data;
                }
              },
              items: sevadetails.map<DropdownMenuItem<String>>((
                  SevaName value) {
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
                style: TextStyle
                  (fontSize: 22,
                    color: Colors.black)),
            MaterialButton(
              child: Text('$buttonvalue1'),
              shape: Border.all(width: 2.0, color: Colors.redAccent),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }
}