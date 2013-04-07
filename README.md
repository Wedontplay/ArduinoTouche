Arduino Touche Library
=============

Processing library to make real world objects interactive. 

* Inspired by the Disney Touche Paper 
* The hardware part is Arduino based
* The software part is Processing based
* The library is designed to be flexible and extensible by experienced users 
* Extensive use of OOP to abstract all the complexities for the user.

-------

## Modules

### Touche 
Main class to handle the device.
It can implement different gesture detectors and change detectors at runtime.
 
### Gesture Detector
Responsible to detect different gesture or states from arduino datas.
It's an abstract class so you must use a concrete detector or write your one that extends it.

### State
Responsible to hold state information.
It's an abstract class, every Detector has its own state, a concrete therefore derived implementation of this class

### Feature Interface
Common interface for various features type.
Insted of analizing all the Arduino datas we extract some intresting features, it's a sort of dimensionality reduction
Concrete features must implements this interface, every state has its own Feature

### User Interface
It's quite ugly actually but its purpose is just to demonstrate the functionalities.

-------

It's my first time with Processing so comments and corrections are welcome.
