import { fibonacci } from "./fibo.wasm"

console.time("fibonacci (WASM)")
fibonacci(40)
console.timeEnd("fibonacci (WASM)")

console.time("fibo (JS)")
fibo(40)
console.timeEnd("fibo (JS)")

function fibo(n) {
	if (n <= 1) {
		return n
	} else {
		return fibo(n - 1) + fibo(n - 2)
	}
}
