class Medusa {
  constructor(name){
    this.name = name
    this.statues = []
  }

  stare(victim){
    if (this.statues.length < 3) {
      this.statues.push(victim)
      victim.becomes_stone();
    }
    else if (this.statues.length === 3){
      this.statues[0].becomes_human()
      this.statues.shift();
      victim.becomes_stone();
      this.statues.push(victim);
    }
  };
};

module.exports = Medusa;