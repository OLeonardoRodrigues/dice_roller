import 'package:flutter/material.dart';
import 'dart:math';

class Roller extends StatefulWidget {
  @override
  _RollerState createState() => _RollerState();
}

class _RollerState extends State<Roller> {
  int _limit = 0;
  int _rolledValue = 0;
  int _selectedIndex = 0;

  _setTheLimit() {
    int _limit = 0;
    switch(this._selectedIndex) {
      case 0:
        _limit = 5;
        break;
      case 1:
        _limit = 7;
        break;
      case 2:
        _limit = 9;
        break;
      case 3:
        _limit = 11;
        break;
      case 4:
        _limit = 13;
        break;
      case 5:
        _limit = 21;
        break;
      default:
        _limit = 0;
    }
    setState(() {
      this._limit = _limit;
    });
  }

  _rollTheDice() {
    _setTheLimit();
    _rolledValue = Random().nextInt(this._limit);
    while(_rolledValue == 0) {
      _rolledValue = Random().nextInt(this._limit);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roller"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                  this._rolledValue.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                  )
              )
          ),
          FlatButton.icon(
              onPressed: _rollTheDice,
              textColor: Colors.red,
              icon: Icon(IconData(0xe816, fontFamily: 'Custom',), size: 47,),
              label: Text("Roll the Dice!", style: TextStyle(fontSize: 20),),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe818, fontFamily: 'Custom',),),
            title: Text("D04"),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe80b, fontFamily: 'Custom',),),
            title: Text("D06"),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe81b, fontFamily: 'Custom',),),
            title: Text("D08"),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe819, fontFamily: 'Custom',),),
            title: Text("D10"),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe81a, fontFamily: 'Custom',),),
            title: Text("D12"),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconData(0xe801, fontFamily: 'Custom',),),
            title: Text("D20"),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
        )
      );
  }
}
