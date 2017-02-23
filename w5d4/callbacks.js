let d = new Date();
global.setInterval(() => console.log(d), 2000);

function printTime() {
  let h = d.getHours();
  let m = d.getMinutes();
  let s = d.getSeconds();
  console.log(`${h}:${m}:${s}`);
}
