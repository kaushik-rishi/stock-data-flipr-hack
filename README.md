# Flipr Hackathon

Mobile Application to See Stock Charts

### TechStack

Flutter
Dart

### Tool
AndroidStudio

### Architecture
MVC architecture is followed in this Application.

### StateManagement

Getx is used for statemanagement.
Reactive State Manager 
Reactive programming can alienate many people because it is said to be complicated. GetX turns reactive programming into something quite simple.

We have multiple pages.

### Screens:

1. Home Page: It contains Stock Index data of BSE and NSE.
2. Company Stock Page: It contains chart of company stock data.

### Data

The Data contains Date, low, high, open, close, AdjClose and Volume of specific market day.


# Backend

### Postman Documentation Link
[![Run in Postman](https://run.pstmn.io/button.svg)](https://www.postman.com/dishanttayade1/workspace/dishant-s-assignments/documentation/16019414-ed36d9dd-ecf5-4245-ad22-fb6d7c75c648)

### Files Description
- hackathon.sql => sql dump file
- index.js => main server file

### Dumping sql file
Once you login in mysql from the terminal using 
```
mysql -u root -p
```
Enter the password and then 
```
source hackathon.sql
```
So that the database will be created.

### Start Backend Server.
- Before starting backend server you need to add proper values to the variables accroding to the mysql server you are connecting to.



# Deployment

Used Digital Ocean's droplet for the deployment.

[Backend Deployment](http://165.232.182.158/)
  - [NSE](http://165.232.182.158/data/NSE)
  - [BSE](http://165.232.182.158/data/BSE)
  - [Cipla](http://165.232.182.158/data/Cipla)
  - [AshokLeyLand](http://165.232.182.158/data/AshokLeyLand)
  - [TataSteel](http://165.232.182.158/data/TataSteel)
  - [EicherMotors](http://165.232.182.158/data/EicherMotors)
  - [Reliance](http://165.232.182.158/data/Reliance)
