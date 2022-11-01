import 'package:flutter/material.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({Key? key}) : super(key: key);

  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  var _message = 'ทายเลข 1 ถึง 100';
  var _num = '';

  Widget _buildNumberButton(int num) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if(_num.length < 3){
              _num = _num + num.toString();
            }
          });
        },
        child: Container(
          width: 60.0,
          height: 30.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Color(0xFFCCCCCC),
              width: 1.0,
            ),
          ),
          child: Text(
              num.toString(),
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.purple)),
        ),
      ),
    );
  }

  Widget _build_X_Button() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
          onTap: () {
            setState(() {
              _num = '';
            });
          },
          child: Container(
            width: 60.0,
            height: 30.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Color(0xFFCCCCCC),
                width: 1.0,
              ),
            ),
            child: const Icon(Icons.close, size: 16.0,color: Colors.purple,),
          )
      ),
    );
  }

  Widget _build_De_Button() {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: InkWell(
          onTap: () {
            setState(() {
              var string = _num.substring(0,_num.length-1);
              _num = string;
            });
          },
          child: Container(
            width: 60.0,
            height: 30.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Color(0xFFCCCCCC),
                width: 1.0,
              ),
            ),
            child: const Icon(Icons.backspace_outlined, size: 16.0,color: Colors.purple,),
          )
      ),
    );
  }


  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('GUESS'),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guess Number'),
      ),
      body: Container(

        decoration: BoxDecoration(
          color: Colors.purple[50],
          borderRadius: BorderRadius.circular(35.0),
          border: Border.all(
            width: 20.0,
            color: Colors.white,
          ),
        ),

        child: Column(
          children: [
            Expanded(flex: 1, child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/guess_logo.png', width: 120.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Guess', style: TextStyle(fontSize: 30.0,color: Colors.purpleAccent)),
                    Text('Number',style: TextStyle(fontSize: 25.0,color: Colors.purpleAccent)),
                  ],
                ),
              ],
            ),
            ),
            Column(
              children: [
                Text(_num,style: TextStyle(fontSize: 30),),
                SizedBox(height: 20,),
                Text(_message,style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                for (var row in [
                  [1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9],
                ])
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [for (var i in row) _buildNumberButton(i)],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _build_X_Button(),
                    _buildNumberButton(0),
                    _build_De_Button(),
                  ],
                ),
               _buildButton(),
                SizedBox(height: 10.0,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
