class Victim {
  constructor(name){
    this.name = name
    this.alive = true
  }

  eaten(){
    this.alive = false
  }
};

module.exports = Victim;