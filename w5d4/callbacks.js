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

const clock = new Clock();
global.setInterval(() => clock._tick(), 1000);
