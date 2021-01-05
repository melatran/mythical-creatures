class Person {
  constructor(name){
    this.name = name
    this.stoned = false
  }

  becomes_stone(){
    this.stoned = true
  }

  becomes_human(){
    this.stoned = false
  }
};

module.exports = Person;