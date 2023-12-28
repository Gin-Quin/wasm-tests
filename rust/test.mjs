import { readFileSync } from "node:fs"

const wasmCode = readFileSync("./pkg/rust_bg.wasm")
const wasmModule = new WebAssembly.Module(wasmCode)
const wasmInstance = new WebAssembly.Instance(wasmModule)

const { fibonacci } = wasmInstance.exports

console.time("fibonacci (WASM)")
fibonacci(40)
console.timeEnd("fibonacci (WASM)")

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
