// class Shape {
//   String type;
//   Shape(this.type);
// }

// class AreaCalculator {
//   double? calculateArea(Shape shape) {
//     if (shape.type == 'circle') {
//       //return 3.14159 * radius * radius;
//     } else if (shape.type == 'square') {
//       //return side * side;
//     } else if (shape.type == 'triangle') {
//       // return 0.5 * base * height;
//     }
//     return null;
//   }
// }

/*
o codigo anterior eh ruim pq o AreaCalculator nao estava fechado 
para modificacao, ou seja, sempre que acrescentarmos um novo shape,
teriamos que mudar essa classe, deixando ela dificil de manter e aumentando
 o risco de bugs.
 */

//nossa abstracao
abstract class Shape {
  double calculateArea();
}

//nossas classes que implementam a abstracao.
//implementando suas proprias implementacoes
class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
}

class Square implements Shape {
  final double side;

  Square(this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}

class Triangle implements Shape {
  final double floor;
  final double height;

  Triangle(this.floor, this.height);

  @override
  double calculateArea() {
    return 0.5 * floor * height;
  }
}

//a classe de calcular delega o calculo para o Shhape,
//sem precisar saber qual eh o shape.
class AreaCalculator {
  double? calculateArea(Shape shape) {
    return shape.calculateArea();
  }
}
