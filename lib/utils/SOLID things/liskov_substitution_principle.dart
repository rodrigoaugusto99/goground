// abstract class Vehicle {
//   void refuel();
//   void move();
// }

// class EletricCar extends Vehicle {
//   @override
//   void move() {
//     // TODO: implement move
//   }

//   @override
//   void refuel() {
//     //charging the battery
//   }
// }

// class PetrolCar extends Vehicle {
//   @override
//   void move() {
//     // TODO: implement move
//   }

//   @override
//   void refuel() {
//     //refiling the petrol
//   }
// }

// void serviceVehicle(Vehicle vehicle) {
//   vehicle.refuel();
// }

/*
codigo acima esta errado pois uma subclasse nao eh totalmente substituivel por outra subclasse 
do tipo vehicle, pois o metodo refuel semanticamentye se a refere apenas a carro a gasolina,
logo, o eletricCar que extende vehicle, teria que implementrar aquela funcao refuel que
semanticamente nao faz sentido.
 */

abstract class Vehicle {
  void move();
}

abstract class ELetricVehicle extends Vehicle {
  void charge();
}

abstract class FuelVehicle extends Vehicle {
  void refuel();
}

class EletricCar extends ELetricVehicle {
  @override
  void charge() {
    // TODO: implement charge
  }

  @override
  void move() {
    // TODO: implement move
  }
}

class PetrolCar extends FuelVehicle {
  @override
  void move() {
    // TODO: implement move
  }

  @override
  void refuel() {
    // TODO: implement refuel
  }
}

void serviceFuelVehicle(FuelVehicle vehicle) {
  vehicle.refuel();
}

void serviceChargeVehicle(ELetricVehicle vehicle) {
  vehicle.charge();
}


/*
 que foi feito: 
 separamos fuel e eletric vehicles em duas diferenes abstracoes, 
 as duas extendendo Vehicle.

 isso nos permite criar metodos separados para cada tipo de veiculo, e isso
 faz com que a gente nao corra o risco de fazer uma acao que nao faz sentido
 semanticamente.
 */