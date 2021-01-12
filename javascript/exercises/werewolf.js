class Werewolf {
  constructor(name, location) {
    this.name = name
    this.location = location
    this.human = true
    this.wolf = false
    this.transformationCount = 0
    this.hungry = false
  }
  
  change(){
    this.transformationCount += 1
    if (this.transformationCount % 2==0) {
      this.humanTransform()
    } else {
      this.wolfTransform()
    }
  }

  humanTransform() {
    this.human = true
    this.wolf = false
    this.hungry = false
  }

  wolfTransform() {
    this.human = false
    this.wolf = true
    this.hungry = true
  }

  eat(victim){
    if(this.hungry == true){
      victim.eaten()
      this.humanTransform()
      return "YUM!"
    } else {
      return "I cannot eat because I am not hungry."
    }
  }
};

module.exports = Werewolf;