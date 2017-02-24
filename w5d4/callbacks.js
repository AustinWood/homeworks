class Clock {
  constructor() {
    let d = new Date();
    this.h = d.getHours();
    this.m = d.getMinutes();
    this.s = d.getSeconds();
  }

  printTime() {
    console.log(`${this.h}:${this.m}:${this.s}`);
  }

  _tick() {
    this.s += 1;
    this.printTime();
  }
}

// const clock = new Clock();
// global.setInterval(() => clock._tick(), 1000);

const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    reader.question("Enter next number to add: ", function (answer) {
      sum += parseInt(answer);
      console.log(`The current sum is: ${sum}`);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  } else {
    completionCallback(sum);
  }
}

addNumbers(0, 3, function (sum) {
  console.log(`The final sum is: ${sum}`);
  reader.close();
});
