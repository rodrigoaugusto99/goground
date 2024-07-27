// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String name;
  User({
    required this.name,
  });
}

// class MySQLDatabase {
//   void saveUser(User user) {
//     print('Saving ${user.name} to MySql database...');
//   }
// }

// class UserService {
//   MySQLDatabase database;
//   UserService({
//     required this.database,
//   });

//   void saveUser(User user) {
//     database.saveUser(user);
//   }
// }

/*
ta ruim pq o service esta diretamente dependente de uma
database especifica. Dessa forma, fica dificil de adaptar
a possiveis futuras mudancas, como trocar para outro database
 */

abstract class Database {
  void saveUser(User user);
}

class MySQLDatabase implements Database {
  @override
  void saveUser(User user) {
    print('Saving ${user.name} to MySql database...');
  }
}

class UserService implements Database {
  Database database;
  UserService({
    required this.database,
  });
  @override
  void saveUser(User user) {
    database.saveUser(user);
  }
}

/*
p resolver isso, o service entao depende e uma abstracao, nao 
precisa saber ou escolher qual database especifico ele esta utilizando.
quem vai saber disso, eh justamente que vai chamar esse service, passando
por parametro o database concreto que quiser.
 */