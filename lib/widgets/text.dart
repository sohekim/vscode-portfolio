import 'package:flutter/material.dart';

Widget mBody(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyText1,
  );
}

Widget boldBody(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
  );
}

Widget coloredBody(BuildContext context, String text) {
  return Text(
    text,
    style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
  );
}

TextSpan bodySpan(BuildContext context, String text) {
  return TextSpan(
    text: text,
    style: Theme.of(context).textTheme.bodyText1,
  );
}

TextSpan boldBodySpan(BuildContext context, String text) {
  return TextSpan(
    text: text,
    style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold),
  );
}

TextSpan coloredBodySpan(BuildContext context, String text) {
  return TextSpan(
    text: text,
    style: Theme.of(context).textTheme.bodyText1.copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
  );
}
