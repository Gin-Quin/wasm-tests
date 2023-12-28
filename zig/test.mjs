import { readFileSync } from "node:fs"

const wasmCode = readFileSync("./fibo.wasm")
const wasmModule = new WebAssembly.Module(wasmCode)
const wasmInstance = new WebAssembly.Instance(wasmModule)

const { fib } = wasmInstance.exports

console.time("fib (WASM)")
fib(40)
console.timeEnd("fib (WASM)")

console.time("fiboJS (JS)")
fiboJS(40)
console.timeEnd("fiboJS (JS)")

function fiboJS(n) {
	if (n <= 1) {
		return n
	} else {
		return fiboJS(n - 1) + fiboJS(n - 2)
	}
}
