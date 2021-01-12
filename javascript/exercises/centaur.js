class Centaur {
  constructor(name, breed) {
    this.name = name
    this.breed = breed
    this.cranky = false
    this.standing = true
    this.activityCount = 0
    this.layingDown = false
  }
  shoot(){
    this.activityCount += 1
    if(this.cranky == true || this.layingDown == true){
      return 'NO!'
    }
    this.checkCrankyStatus()
    return 'Twang!!!'
  }
  run(){
    this.activityCount += 1
    if(this.cranky == true || this.layingDown == true){
      return 'NO!'
    }
    this.checkCrankyStatus()
    return 'Clop clop clop clop!!!'
  }
  checkCrankyStatus(){
    if(this.activityCount < 3){
      this.cranky = true
      return 'NO!'
    }
  }
  sleep(){
    if(this.standing){
      return 'NO!'
    } else {
      this.cranky = false
      return 'ZZZZ'
    }
  }
  layDown(){
    this.standing = false
    this.layingDown = true
  }
  standUp(){
    this.standing = true
    this.layingDown = false
  }
  drinkPotion(){
    if(this.standing == false){
      return 'Not while I\'m laying down!'
    } else if (this.cranky == false){
        this.cranky = true
    } else if (this.cranky == true) {
      this.cranky = false
    }
  }
};

module.exports = Centaur;
