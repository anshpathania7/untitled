import 'package:cometchat_sdk/cometchat_sdk.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/services/navigator_service.dart';
import 'package:untitled/ui/chat_screen.dart';

///NOTE : THIS IS GPT GENERATED UI
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text;
      final password = passwordController.text;
      //temporary uid
      final uid = (email + password).hashCode.toString();
      //try logging in, if user doesnt exist then register and login
      User? user = await CometChat.login(uid, CometChatKeys.CC_AUTH_KEY,
          onSuccess: (isSuccess) {}, onError: (error) {});
      //register here
      if (user == null) {
        user = User(name: email, uid: uid);
        final registeredUser = await CometChat.createUser(
          user,
          CometChatKeys.CC_AUTH_KEY,
          onSuccess: (success) {},
          onError: (error) {
            //
          },
        );
        if (registeredUser != null) {
          //login here
          final loggedUser = await CometChat.login(
              uid, CometChatKeys.CC_AUTH_KEY,
              onSuccess: (success) {}, onError: (error) {});
          if (loggedUser != null) {
            NavigationService.removeEveryAndPush(screen: ChatScreen());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Login Failed, Try again later")));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Registration Failed, Try again later")));
        }
      } else {
        //login here
        final loggedUser = await CometChat.login(uid, CometChatKeys.CC_AUTH_KEY,
            onSuccess: (success) {}, onError: (error) {});
        if (loggedUser != null) {
          NavigationService.removeEveryAndPush(screen: ChatScreen());
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Login Failed, Try again later")));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  if (!value.contains("@")) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
