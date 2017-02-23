function uniq(array) {
  let outputArray = [];
  let i = 0;
  while (i < array.length) {
    el = array[i];
    if (!outputArray.includes(el)) {
      outputArray.push(el);
    }
    i++;
  }
  return outputArray;
}

function twoSum(array) {
  let outputArray = [];
  let i = 0;
  while (i < array.length - 1) {
    el = array[i];
    let j = i + 1;
    while (j < array.length) {
      el2 = array[j];
      if (el + el2 === 0) {
        outputArray.push([i,j]);
      }
      j++;
    }
    i++;
  }
  return outputArray;
}

function transpose(array) {
  let outputArray = [];
  for (k = 0; k < array.length; k++) {
    outputArray.push([]);
  }
  let i = 0;
  while (i < array.length) {
    let j = 0;
    while (j < array.length) {
      outputArray[j].push(array[i][j]);
      j++;
    }
    i++;
  }
  return outputArray;
}

Array.prototype.myEach = function (callBack) {
  let i = 0;
  while (i < this.length) {
    callBack(this[i]);
    i++;
  }
}

Array.prototype.myMap = function (callback) {
  let outputArray = [];
  this.myEach(function(currentEl) {
    outputArray.push(callback(currentEl));
  });
  return outputArray;
}

Array.prototype.myInject = function (callback) {
  let result = this.shift();
  this.myEach(el => result = callback(result, el));
  return result;
}

Array.prototype.bubbleSort = function() {
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (i = 0; i < this.length - 1; i++) {
      if (this[i] > this[i + 1]) {
        sorted = false;
        let temp = this[i + 1];
        this[i + 1] = this[i];
        this[i] = temp;
      }
    }
  }
  return this;
}

String.prototype.subs = function() {
  let subs = [];
  for (i = 0; i < this.length; i++) {
    for (j = i + 1; j <= this.length; j++) {
      subs.push(this.slice(i, j));
    }
  }
  return subs;
}

function exp(base, n) {
  // base cases
  if (n === 1) {
    return base;
  } else if (n === 0) {
    return 1;
  }

  if (n % 2 === 0) {
    let result = exp(base, n / 2);
    return result * result;
  } else {
    let result = exp(base, (n -1) / 2);
    return base * (result * result);
  }
}

function fib(n) {
  if (n <= 0) {
    return "You're crazy";
  }
  if (n === 1 || n === 2) {
    return n === 1 ? [1] : [1, 1];
  }
  let fibs = fib(n - 1);
  fibs.push(fibs[fibs.length - 1] + fibs[fibs.length - 2]);
  return fibs;
}

function bsearch(array, target) {
  if (array.length === 0) {
    return undefined;
  }
  let midIndex = Math.floor(array.length / 2);
  if (array[midIndex] === target) {
    return midIndex;
  } else if (array[midIndex] > target) {
    return bsearch(array.slice(0, midIndex), target);
  } else {
    let bsearchResult = bsearch(
      array.slice(midIndex + 1, array.length),
      target);
    if (bsearchResult) {
      return bsearchResult + midIndex + 1;
    } else {
      return undefined;
    }
  }
}

function makeChange(change, coins) {
  if (change <= 0) {
    return [];
  }
  let bestCoinArray = [];
  coins.myEach(function(coin) {
    if (coin <= change) {
      let currentCoinArray = [];
      if (coin <= change) {
        let remainder = change - coin;
        // let selectedCoins = coins.filter(coin => coin < remainder)
        let selectedCoins = coins;
        currentCoinArray.push(coin);
        let recursive = makeChange(remainder, selectedCoins);
        currentCoinArray = currentCoinArray.concat(recursive);
      }
      if (currentCoinArray.length < bestCoinArray.length || bestCoinArray.length === 0) {
        bestCoinArray = currentCoinArray;
      }
    }
  });
  return bestCoinArray;
}
