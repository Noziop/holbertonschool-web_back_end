#!/bin/bash

# Créer le dossier du projet
mkdir -p ES6_basic

# Se déplacer dans le dossier
cd ES6_basic

# Créer le .gitignore
echo "# Dependencies
node_modules/

# Excercise files
*main.js

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
Thumbs.db
" > .gitignore

# Créer les fichiers d'exercices
touch 0-constants.js 1-block-scoped.js 2-arrow.js 3-default-parameter.js \
      4-rest-parameter.js 5-spread-operator.js 6-string-interpolation.js \
      7-getBudgetObject.js 8-getBudgetCurrentYear.js 9-getFullBudget.js \
      10-loops.js 11-createEmployeesObject.js 12-createReportObject.js \
      100-createIteratorObject.js 101-iterateThroughObject.js

# Créer les fichiers main
# 0-main.js
echo "import { taskFirst, taskNext } from './0-constants.js';

console.log(\`\${taskFirst()} \${taskNext()}\`);" > 0-main.js

# 1-main.js
echo "import taskBlock from './1-block-scoped.js';

console.log(taskBlock(true));
console.log(taskBlock(false));" > 1-main.js

# 2-main.js
echo "import getNeighborhoodsList from './2-arrow.js';

const neighborhoodsList = new getNeighborhoodsList();
const res = neighborhoodsList.addNeighborhood('Noe Valley');
console.log(res);" > 2-main.js

# 3-main.js
echo "import getSumOfHoods from './3-default-parameter.js';

console.log(getSumOfHoods(34));
console.log(getSumOfHoods(34, 3));
console.log(getSumOfHoods(34, 3, 4));" > 3-main.js

# 4-main.js
echo "import returnHowManyArguments from './4-rest-parameter.js';

console.log(returnHowManyArguments(\"one\"));
console.log(returnHowManyArguments(\"one\", \"two\", 3, \"4th\"));" > 4-main.js

# 5-main.js
echo "import concatArrays from './5-spread-operator.js';

console.log(concatArrays(['a', 'b'], ['c', 'd'], 'Hello'));" > 5-main.js

# 6-main.js
echo "import getSanFranciscoDescription from './6-string-interpolation.js';

console.log(getSanFranciscoDescription());" > 6-main.js

# 7-main.js
echo "import getBudgetObject from './7-getBudgetObject.js';

console.log(getBudgetObject(400, 700, 900));" > 7-main.js

# 8-main.js
echo "import getBudgetForCurrentYear from './8-getBudgetCurrentYear.js';

console.log(getBudgetForCurrentYear(2100, 5200, 1090));" > 8-main.js

# 9-main.js
echo "import getFullBudgetObject from './9-getFullBudget.js';

const fullBudget = getFullBudgetObject(20, 50, 10);

console.log(fullBudget.getIncomeInDollars(fullBudget.income));
console.log(fullBudget.getIncomeInEuros(fullBudget.income));" > 9-main.js

# 10-main.js
echo "import appendToEachArrayValue from './10-loops.js';

console.log(appendToEachArrayValue(['appended', 'fixed', 'displayed'], 'correctly-'));" > 10-main.js

# 11-main.js
echo "import createEmployeesObject from './11-createEmployeesObject.js';

console.log(createEmployeesObject(\"Software\", [ \"Bob\", \"Sylvie\" ]));" > 11-main.js

# 12-main.js
echo "import createEmployeesObject from './11-createEmployeesObject.js';
import createReportObject from './12-createReportObject.js';

const employees = {
    ...createEmployeesObject('engineering', ['Bob', 'Jane']),
    ...createEmployeesObject('marketing', ['Sylvie'])
};      

const report = createReportObject(employees);
console.log(report.allEmployees);
console.log(report.getNumberOfDepartments(report.allEmployees));" > 12-main.js

# 100-main.js
echo "import createIteratorObject from \"./100-createIteratorObject.js\";

import createEmployeesObject from './11-createEmployeesObject.js';
import createReportObject from './12-createReportObject.js';

const employees = {
    ...createEmployeesObject('engineering', ['Bob', 'Jane']),
    ...createEmployeesObject('marketing', ['Sylvie'])
};

const report = createReportObject(employees);

const reportWithIterator = createIteratorObject(report);

for (const item of reportWithIterator) {
    console.log(item);
}" > 100-main.js

# 101-main.js
echo "import createEmployeesObject from \"./11-createEmployeesObject.js\";
import createReportObject from './12-createReportObject.js';
import createIteratorObject from './100-createIteratorObject.js';
import iterateThroughObject from './101-iterateThroughObject.js';

const employees = {
    ...createEmployeesObject('engineering', ['Bob', 'Jane']),
    ...createEmployeesObject('marketing', ['Sylvie'])
};

const report = createReportObject(employees);
const reportWithIterator = createIteratorObject(report);

console.log(iterateThroughObject(reportWithIterator));" > 101-main.js

# Initialiser npm et installer les dépendances
npm init -y
npm install --save-dev jest babel-jest @babel/core @babel/preset-env eslint

# Créer babel.config.js
echo "module.exports = {
  presets: [
    [
      '@babel/preset-env',
      {
        targets: {
          node: 'current',
        },
      },
    ],
  ],
};" > babel.config.js

# Créer .eslintrc.js
echo "module.exports = {
  env: {
    browser: false,
    es6: true,
    jest: true,
  },
  extends: [
    'airbnb-base',
    'plugin:jest/all',
  ],
  globals: {
    Atomics: 'readonly',
    SharedArrayBuffer: 'readonly',
  },
  parserOptions: {
    ecmaVersion: 2018,
    sourceType: 'module',
  },
  plugins: ['jest'],
  rules: {
    'no-console': 'off',
    'no-shadow': 'off',
    'no-restricted-syntax': [
      'error',
      'LabeledStatement',
      'WithStatement',
    ],
  },
  overrides:[
    {
      files: ['*.js'],
      excludedFiles: 'babel.config.js',
    }
  ]
};" > .eslintrc.js

# Modifier le package.json pour ajouter les scripts
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

# Installer les dépendances
npm install --save-dev @babel/node eslint-config-airbnb-base eslint-plugin-import eslint-plugin-jest