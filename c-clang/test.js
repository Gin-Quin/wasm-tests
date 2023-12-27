import { readFileSync } from "node:fs"

const wasmCode = readFileSync("./fibo.wasm")
const wasmModule = new WebAssembly.Module(wasmCode)
const wasmInstance = new WebAssembly.Instance(wasmModule)

const { fibonacci } = wasmInstance.exports

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
