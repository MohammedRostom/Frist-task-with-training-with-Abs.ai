import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_auth_with_firebases_auth/constant.dart';
import 'package:task_auth_with_firebases_auth/model/UserInfoModel.dart';

class ProividerClassViewModel with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  bool isLoading = false;
  UserinfoModel? userInfo;

  Future<void> login(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print('Login successful! User ID: ${userCredential.user?.uid}');
      isLoading = false;
      notifyListeners();

      await _showSnackBarAndNavigate(
        context,
        userCredential,
        "Login successful!",
        "HomePage",
      );

      _clearTextFields("Login");
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();

      if (e.code == 'user-not-found') {
        _showErrorDialog(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showErrorDialog(context, 'Wrong password provided.');
      } else {
        print('Error: $e');
      }
    }
    userInfo = UserinfoModel(
      username: userNameController.text,
      Email: emailController.text,
      Password: passwordController.text,
    );
  }

  Future<void> register(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      print('Registration successful! User ID: ${userCredential.user?.uid}');
      await _showSnackBarAndNavigate(
        context,
        userCredential,
        "Registration successful",
        "Login",
      );

      userInfo = UserinfoModel(
        username: userNameController.text,
        Email: emailController.text,
        Password: passwordController.text,
        userid: userCredential.user!.uid,
      );

      await addCollection(
        NameCollection,
        {
          "UserName": userNameController.text,
          "Email": emailController.text,
          "Password": passwordController.text,
          "UserId": userCredential.user!.uid,
        },
      );

      _clearTextFields("Register");
    } on FirebaseAuthException catch (e) {
      isLoading = false;
      notifyListeners();

      if (e.code == 'email-already-in-use') {
        _showErrorDialog(
          context,
          'The account already exists for that email.',
        );
      } else {
        print('Error: $e');
      }
    }
  }

  Future<void> _showSnackBarAndNavigate(
    BuildContext context,
    UserCredential userCredential,
    String textSnackBar,
    String routeName,
  ) async {
    isLoading = false;
    notifyListeners();

    await ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.done,
              color: Colors.white,
            ),
            Text('$textSnackBar'),
          ],
        ),
        duration: Duration(seconds: 2),
      ),
    );

    await Future.delayed(Duration(seconds: 3));
    Navigator.pushNamed(context, routeName);
    print(userCredential.user!.email);
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(errorMessage),
      ),
    );
  }

  void _clearTextFields(String formType) {
    if (formType == "Login") {
      emailController.clear();
      passwordController.clear();
    } else if (formType == "Register") {
      userNameController.clear();
      emailController.clear();
    }
  }

  Future<void> addCollection(
      String collectionName, Map<String, dynamic> data) async {
    try {
      await _firestore.collection(collectionName).add(data);
      print('Collection added successfully');
    } catch (e) {
      print('Error adding collection: $e');
      // Handle the error as needed
    }
  }
}
