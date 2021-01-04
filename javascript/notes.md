# JavaScript Notes

```
class Dog {
  constructor(name) {
    this.name = name //parameter
  }

  bark() {
    console.log("Woof")
  }
}
```

```
var dog = new Dog('Boop');
dog.bark(); //calling a method use ()
```

- `this` refers to the object being created
- class to create many objects using a constructor to define properties and methods below to define behaviors