import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo/bean/image_bean.dart';
import 'package:photo/net/dio_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        context: context,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, this.context}) : super(key: key);
  final String title;
  BuildContext? context;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<ImageBean> _imageBean = [];

  getImageLIst() async {
    var value = await DioUtils.instance.getRequest(url: HttpHelper.imageList);
    if (value.success && value.data != null) {
      var list = value.data as List;
      var imageList = list.map((e) => ImageBean.fromMap(e)).toList();
      print("xxxxx");
      print(imageList);
      setState(() {
        _imageBean = imageList;
      });
    }
    Fluttertoast.showToast(msg: value.message, toastLength: Toast.LENGTH_LONG);
    print(value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImageLIst();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _genImageList() {
    return _imageBean.map((e) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 24),
        child: Image.network(e.addr!),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: _genImageList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
