#!/bin/bash
# Créer le .gitignore
echo "# Dependencies
node_modules/

# Environment
.env

# Build
dist/
build/

# Logs
*.log
npm-debug.log*

# IDE specific files
.idea/
.vscode/
*.swp
*.swo

# OS specific files
.DS_Store
Thumbs.db" > .gitignore

# Créer les fichiers d'exercices
touch 0-classroom.js 1-make_classrooms.js 2-hbtn_course.js \
      3-currency.js 4-pricing.js 5-building.js 6-sky_high.js \
      7-airport.js 8-hbtn_class.js 9-hoisting.js 10-car.js \
      100-evcar.js

# Créer les fichiers main avec leur contenu
echo 'import ClassRoom from "./0-classroom.js";

const room = new ClassRoom(10);
console.log(room._maxStudentsSize);' > 0-main.js

echo 'import initializeRooms from "./1-make_classrooms.js";

console.log(initializeRooms());' > 1-main.js

echo 'import HolbertonCourse from "./2-hbtn_course.js";

const c1 = new HolbertonCourse("ES6", 1, ["Bob", "Jane"])
console.log(c1.name);
c1.name = "Python 101";
console.log(c1);

try {
    c1.name = 12;
} 
catch(err) {
    console.log(err);
}

try {
    const c2 = new HolbertonCourse("ES6", "1", ["Bob", "Jane"]);
}
catch(err) {
    console.log(err);
}' > 2-main.js

echo 'import Currency from "./3-currency.js";

const dollar = new Currency("$", "Dollars");
console.log(dollar.displayFullCurrency());' > 3-main.js

echo 'import Pricing from "./4-pricing.js";
import Currency from "./3-currency.js";

const p = new Pricing(100, new Currency("EUR", "Euro"))
console.log(p);
console.log(p.displayFullPrice());' > 4-main.js

echo 'import Building from "./5-building.js";

const b = new Building(100);
console.log(b);

class TestBuilding extends Building {}

try {
    new TestBuilding(200)
}
catch(err) {
    console.log(err);
}' > 5-main.js

echo 'import SkyHighBuilding from "./6-sky_high.js";

const building = new SkyHighBuilding(140, 60);
console.log(building.sqft);
console.log(building.floors);
console.log(building.evacuationWarningMessage());' > 6-main.js

echo 'import Airport from "./7-airport.js";

const airportSF = new Airport("San Francisco Airport", "SFO");
console.log(airportSF);
console.log(airportSF.toString());' > 7-main.js

echo 'import HolbertonClass from "./8-hbtn_class.js";

const hc = new HolbertonClass(12, "Mezzanine")
console.log(Number(hc));
console.log(String(hc));' > 8-main.js

echo 'import listOfStudents from "./9-hoisting.js";

console.log(listOfStudents);

const listPrinted = listOfStudents.map(
    student => student.fullStudentDescription
);

console.log(listPrinted);' > 9-main.js

echo 'import Car from "./10-car.js";

class TestCar extends Car {}

const tc1 = new TestCar("Nissan", "Turbo", "Pink");
const tc2 = tc1.cloneCar();

console.log(tc1);
console.log(tc1 instanceof TestCar);

console.log(tc2);
console.log(tc2 instanceof TestCar);

console.log(tc1 == tc2);' > 10-main.js

echo 'import EVCar from "./100-evcar.js";

const ec1 = new EVCar("Tesla", "Turbo", "Red", "250");
console.log(ec1);

const ec2 = ec1.cloneCar();
console.log(ec2);' > 100-main.js

# Créer le README.md
echo "# ES6 Classes

## Description
This project focuses on ES6 classes and object-oriented programming in JavaScript. It covers class definition, methods, static methods, inheritance, and metaprogramming concepts.

## Learning Objectives
- How to define a Class in ES6
- How to add methods to a class
- Why and how to add a static method to a class
- How to extend a class from another
- Metaprogramming and symbols in JavaScript

## Requirements
- Ubuntu 20.04 LTS using NodeJS 20.x.x
- npm 9.x.x
- Jest Testing Framework
- ESLint

## Setup
\`\`\`bash
# Install NodeJS 20.x.x
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt install nodejs -y

# Install project dependencies
npm install
\`\`\`

## Files
- 0-classroom.js: Basic class implementation
- 1-make_classrooms.js: Creating class instances
- 2-hbtn_course.js: Getters and setters
- 3-currency.js: Method implementation
- 4-pricing.js: Static methods
- 5-building.js: Abstract classes
- 6-sky_high.js: Class inheritance
- 7-airport.js: String representation
- 8-hbtn_class.js: Type conversion
- 9-hoisting.js: Class hoisting
- 10-car.js: Class cloning
- 100-evcar.js: Advanced inheritance" > README.md

# Initialiser npm et installer les dépendances
npm init -y
npm install --save-dev jest babel-jest @babel/core @babel/preset-env @babel/node eslint eslint-config-airbnb-base eslint-plugin-import eslint-plugin-jest

# Créer les fichiers de configuration
echo '{
  "scripts": {
    "lint": "./node_modules/.bin/eslint",
    "check-lint": "lint [0-9]*.js",
    "dev": "npx babel-node",
    "test": "jest",
    "full-test": "./node_modules/.bin/eslint [0-9]*.js && jest"
  },
  "devDependencies": {
    "@babel/core": "^7.6.0",
    "@babel/node": "^7.8.0",
    "@babel/preset-env": "^7.6.0",
    "eslint": "^6.4.0",
    "eslint-config-airbnb-base": "^14.0.0",
    "eslint-plugin-import": "^2.18.2",
    "eslint-plugin-jest": "^22.17.0",
    "jest": "^24.9.0"
  }
}' > package.json

echo 'module.exports = {
  presets: [
    [
      "@babel/preset-env",
      {
        targets: {
          node: "current",
        },
      },
    ],
  ],
};' > babel.config.js

echo 'module.exports = {
  env: {
    browser: false,
    es6: true,
    jest: true,
  },
  extends: [
    "airbnb-base",
    "plugin:jest/all",
  ],
  globals: {
    Atomics: "readonly",
    SharedArrayBuffer: "readonly",
  },
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: "module",
  },
  plugins: ["jest"],
  rules: {
    "no-console": "off",
    "no-shadow": "off",
    "no-restricted-syntax": [
      "error",
      "LabeledStatement",
      "WithStatement",
    ],
  },
  overrides:[
    {
      files: ["*.js"],
      excludedFiles: "babel.config.js",
    }
  ]
};' > .eslintrc.js
