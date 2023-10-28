import 'package:http/http.dart' as http;
import 'dart:convert';

 class NetworkBrain{

  String? url;
  NetworkBrain(this.url);


  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(url!));

    if(response.statusCode == 200){
      var decoder = jsonDecode(response.body);
     return  decoder;
    }else{
      print(response.statusCode);
    }
  }


}
