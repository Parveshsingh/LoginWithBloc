import 'package:demo/common.dart';
import 'package:demo/login_bloc.dart';
import 'package:demo/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late LoginBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<LoginBloc, ParentState>(
        listener: (context, state) {
          if(state.state == LoginState.loading)
            {
              print("LoginState is Loading");
              showLoader(context);
            }else if(state.state == LoginState.success)
              {
                print("LoginState is Success");
                cancelLoader(context);
              }else if(state.state == LoginState.error)
                {
                  print("Loginstate is Error");
                  cancelLoader(context);
                }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      obscureText: true, // Hide the password
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _bloc.add(BlocEvent(event: LoginEvent.login));
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
