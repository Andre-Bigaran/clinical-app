import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  void _navigateToLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(onLoginPressed: _onLoginPressed)),
    );
  }

  void _onLoginPressed() async {
    final apiUrl = 'http://localhost:1337/api/users'; // Substitua pela sua URL de login
    final response = await http.post(Uri.parse(apiUrl), body: {
      'email': 'andre@medico.com',// Substitua pela senha fornecida pelo usuário
    });

    if (response.statusCode == 200) {
      print('Resposta da API: ${response.body}');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print('Erro na solicitação HTTP: ${response.statusCode}');
      // Você pode lidar com erros aqui, como exibindo uma mensagem de erro para o usuário
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFBEE1FF), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 100,
            width: MediaQuery.of(context).size.width,
            child: Icon(
              Icons.favorite,
              color: Color(0xFF52A8FF),
              size: 200.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Escolha uma opção',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    ElevatedButton(
                      onPressed: _navigateToLoginPage,
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 45, 144, 242),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width - 40, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        shadowColor: Colors.black.withOpacity(0.5),
                        elevation: 10.0,
                      ),
                      child: Text('Login', style: TextStyle(fontSize: 18.0)),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: const Color.fromARGB(255, 41, 41, 41),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width - 40, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5.0,
                        shadowColor: Colors.black.withOpacity(0.5),
                      ),
                      child: Text('Realizar cadastro',
                          style: TextStyle(fontSize: 18.0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final VoidCallback onLoginPressed;

  const LoginPage({Key? key, required this.onLoginPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFBEE1FF), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 50,
            width: MediaQuery.of(context).size.width,
            child: Icon(
              Icons.favorite,
              color: Color(0xFF52A8FF),
              size: 200.0,
            ),
          ),
          Positioned(
            top: 250,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fazer Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Digite seu e-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text('Aceitar termos e condições'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: onLoginPressed,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 45, 144, 242),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 40, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      shadowColor: Colors.black.withOpacity(0.5),
                      elevation: 10.0,
                    ),
                    child:
                        Text('Fazer Login', style: TextStyle(fontSize: 18.0)),
                  ),
                  SizedBox(height: 16.0),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Não tem uma conta? Cadastre-se aqui',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Esqueceu sua senha? Solicite aqui',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class NavigationUtils {

  static void navigateToExamsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExamsPage()),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFBEE1FF), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 50,
            width: MediaQuery.of(context).size.width,
            child: Icon(
              Icons.favorite,
              color: Color(0xFF52A8FF),
              size: 200.0,
            ),
          ),
          Positioned(
            top: 250,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Criar uma conta',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      hintText: 'Digite seu nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Digite seu e-mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      hintText: 'Digite sua senha',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      hintText: 'Digite sua senha novamente',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para completar o cadastro
                      // Você pode adicionar a lógica necessária para armazenar os dados do usuário

                      // Utilize a função da classe de utilidade para navegar para a tela de login após o cadastro.
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 45, 144, 242),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width - 40, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      shadowColor: Colors.black.withOpacity(0.5),
                      elevation: 10.0,
                    ),
                    child: Text('Completar Cadastro',
                        style: TextStyle(fontSize: 18.0)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // Função para lidar com o clique nos ícones
  void _handleIconClick(String iconName, BuildContext context) {
    // Lógica para lidar com o clique nos ícones
    print('Clicou no ícone: $iconName');

    // Adicione a lógica de navegação para a página de exames
    if (iconName == 'Exames') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExamsPage()),
      );
    }
    // Adicione lógica para a página de remédios
    else if (iconName == 'Remédios') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MedicinesPage()),
      );
    }
    // Adicione lógica para a página de receitas
    else if (iconName == 'Receitas') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RecipesPage()),
      );
    }
    // Adicione lógica semelhante para outras páginas, se necessário
  }

  // Função para abrir o Drawer
  void _openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  // Função para construir o Drawer
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Exames'),
            onTap: () {
              Navigator.pop(context); // Feche o Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExamsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Remédios'),
            onTap: () {
              Navigator.pop(context); // Feche o Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MedicinesPage()),
              );
            },
          ),
          ListTile(
            title: Text('Receitas'),
            onTap: () {
              Navigator.pop(context); // Feche o Drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipesPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // Adicione a decoração desejada
            decoration: BoxDecoration(
              color: Color(0xFFBEE1FF),
            ),
          ),
          Positioned(
            top: 40.0,
            left: 16.0,
            child: InkWell(
              onTap: () {
                // Adicione aqui a lógica para voltar à tela anterior
                print('Clicou no ícone de voltar');
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.0,
                child: Icon(
                  Icons.arrow_back,
                  color: Color(0xFFBEE1FF),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35.0),
                  topRight: Radius.circular(35.0),
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Bem-vindo, Nome',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'Menu principal',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 116.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildIconButton(
                          Icons.assignment,
                          'Exames',
                          context,
                        ),
                        _buildIconButton(
                          Icons.local_hospital,
                          'Remédios',
                          context,
                        ),
                        _buildIconButton(
                          Icons.receipt,
                          'Receitas',
                          context,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 220.0,
            left: MediaQuery.of(context).size.width * 0.5 - 50.0,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 50.0,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Se o índice for 1 (ícone "Menu"), abra o Drawer
            _openDrawer(context);
          } else {
            // Lógica para lidar com a navegação do menu no rodapé (ícone "Home")
            print('Clicou no ícone "Home"');
          }
        },
      ),
      drawer: _buildDrawer(context),
    );
  }

  Widget _buildIconButton(IconData icon, String label, BuildContext context) {
    return InkWell(
      onTap: () => _handleIconClick(label, context),
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () => _handleIconClick(label, context),
              child: Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExamsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 60.0,
            left: 16.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20.0,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 130.0,
            left: 16.0,
            right: 16.0,
            child: Card(
              color: Color(0xFFCCE5FF),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Ícone à esquerda
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 40.0,
                      child: Icon(
                        Icons.assignment,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                    SizedBox(
                        width:
                            16.0), // Adicionando espaço entre o ícone e o texto
                    // Textos à direita
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome do Exame',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Descrição do exame vai aqui.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              print('Visualizar exame');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width - 80, 50.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Visualizar',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}

class MedicinesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 60.0,
            left: 16.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20.0,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 130.0,
            left: 16.0,
            right: 16.0,
            child: Card(
              color: Color(0xFFCCE5FF),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Ícone à esquerda
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 40.0,
                      child: Icon(
                        Icons.local_hospital,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                    SizedBox(
                        width:
                            16.0), // Adicionando espaço entre o ícone e o texto
                    // Textos à direita
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome do Remédio',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Descrição do remédio vai aqui.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              print('Detalhes do remédio');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width - 80, 50.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Detalhes',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}

class RecipesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 60.0,
            left: 16.0,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 20.0,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 130.0,
            left: 16.0,
            right: 16.0,
            child: Card(
              color: Color(0xFFCCE5FF),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Ícone à esquerda
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 40.0,
                      child: Icon(
                        Icons.receipt,
                        color: Colors.white,
                        size: 40.0,
                      ),
                    ),
                    SizedBox(
                        width:
                            16.0), // Adicionando espaço entre o ícone e o texto
                    // Textos à direita
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome da Receita',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Descrição da receita vai aqui.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              print('Detalhes da receita');
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width - 80, 50.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text(
                              'Detalhes',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(0),
            ),
          ),
        ],
      ),
    );
  }
}
