import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(context, '367', 'Peers'),
        buildDriver(),
        buildButton(context, '10', 'Pending'),
      ],
    )
  );

  Widget buildDriver() => VerticalDivider();

  Widget buildButton(BuildContext context, String value, String text) => (
    MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,)
          ),
          SizedBox(height: 2,),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    )
  );

}