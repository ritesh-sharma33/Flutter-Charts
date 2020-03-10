import 'package:flutter/material.dart';
import 'package:flutter_charts/bar_chart.dart';
import 'package:flutter_charts/line_chart.dart';
import 'package:flutter_charts/pie_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-Charts & Graphs demystified',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter-Charts & Graphs demystified'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Widget _buildCard(String assetUrl, String title, int index) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: deviceHeight * 0.45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          onTap: () {
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BarChart()
                )
              );
            } else if (index == 2) {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => LineChart()
                )
              );
            } else if (index == 3) {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => PieChart()
                )
              );
            }
          },
          child: Stack(
            children: <Widget>[
              Container(
                height: deviceHeight * 0.3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    image: AssetImage(assetUrl)
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: deviceHeight * 0.125),
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 29
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 25,),
            _buildCard('assets/images/barchart.jpg', 'Bar-Chart Example', 1),
            SizedBox(height: 25,),
            _buildCard('assets/images/linechart.png', 'Line-Chart Example', 2),
            SizedBox(height: 25,),
            _buildCard('assets/images/piechart.jpg', 'Pie-Chart Example', 3)
          ],
        ),
      ),
    );
  }
}
