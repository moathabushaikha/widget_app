import 'package:widget_app/models/images_model.dart';
import 'package:widget_app/models/user_server.dart';
import 'package:http/http.dart' as http;
import 'package:widget_app/views/home_page/server_images_page.dart';
import '../utilities/constants.dart';
import 'package:sqflite/sqflite.dart';
class ApiService
{
  User? curntUser;
  final List loggedInUser = [];
  Future checkUser(String userName, String password) async {
    // return to be a type of user without accepted array -- using guard clause
    List<bool> accepted = [false,false];
    List<User?> users = await getUsers();
    print('$password ${users[0]?.username} $userName ${users[0]?.email}');
    for (int i = 0; i < users.length; i++) {
      if (users[i]?.email.toString().toLowerCase() == userName.toLowerCase()){
        if (users[i]?.username == password)
        {
          accepted[1] = true;
          curntUser = users[i];
          break;
        }
      }
    }
    loggedInUser.add(accepted[0]);
    loggedInUser.add(accepted[1]);
    loggedInUser.add(curntUser);
    return loggedInUser;
  }
  Future<List<User?>> getUsers() async {
    try {
      final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.userPath);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<User?> user = userFromJson(response.body);
        return user;
      }
    } catch (e) {
      print(e);
    }
    throw 'cant get users';
  }
  Future<List<ServerImage?>> getImages() async {
    try {
      final Uri url = Uri.parse(ApiConstants.baseUrl + ApiConstants.imagePath);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<ServerImage?> images = imageFromJson(response.body);
        return images;
      }
    } catch (e) {
      print(e);
    }
    throw 'cant get users';
  }
}