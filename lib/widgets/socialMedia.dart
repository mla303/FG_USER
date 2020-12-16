import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

String fburl = "https://www.facebook.com";
String youtubeurl = "https://m.youtube.com/channel/UCgVE6dZuthHlL5TnW6pUDDg";
String instaurl = "https://m.instagram.com/henke_palm/";
String tiktokUrl = "https://www.tiktok.com/@_henkepalm/";





void _facebook() async{
  if (await canLaunch(fburl)) {
  bool launch_succeeded = await launch(fburl,
  forceSafariVC: false,
  forceWebView: false,
  universalLinksOnly: true
  );
  if(!launch_succeeded)
  {
  launch(fburl,
  forceWebView: false,
  forceSafariVC: true
  );
  }
  } else {
  print("URL launch failed exaption ...//TODO handle its implementation");
  throw 'Could not launch $fburl';
  }
}
