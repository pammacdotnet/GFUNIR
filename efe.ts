// @deno-types="https://raw.githubusercontent.com/pammacdotnet/GFUNIR/main/mathjs.d.ts";
import math from "https://dev.jspm.io/mathjs";
math.createUnit("gauss", "0.001 T");
const B: math.Unit = math.unit(3250, "gauss");
B.to("T");
console.log(B.toSI().toString());

const q: math.Unit = math.evaluate("elementaryCharge");

const m: math.Unit = math.evaluate("electronMass");

const E: math.Unit = math.unit(72090E-19, "J");

const v: math.Unit = math.sqrt(
  math.multiply(2, math.divide(E, m) as math.Unit) as math.Unit,
);

const radio = math.divide(
  math.multiply(m, v),
  math.multiply(q, B),
);

console.log(radio.toString());
