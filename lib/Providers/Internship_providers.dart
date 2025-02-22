import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gunma/models/Internship.dart';
import 'package:http/http.dart' as http;

class InternshipProvider extends ChangeNotifier{

  getRecommendedSpaces() async{
    var result = await http.get(Uri.parse("http://api.gunma.my.id/api/v1/internship"),
    );
    
    print(result.statusCode);
    // 200 = true, 404 = false
    print(result.body);

    if (result.statusCode == 200){
        
        List data =  jsonDecode(result.body);
        List<Internship> spaces = data.map((item) => Internship.fromJson(item)).toList();
        return spaces;
    }else{
      return <Internship>[];
    }
  }
}