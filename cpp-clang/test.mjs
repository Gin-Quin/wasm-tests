import { readFileSync } from "node:fs"

const wasmCode = readFileSync("./fibo.wasm")
const wasmModule = new WebAssembly.Module(wasmCode)
const wasmInstance = new WebAssembly.Instance(wasmModule)

const { fibo } = wasmInstance.exports

console.time("fibo (WASM)")
fibo(40)
console.timeEnd("fibo (WASM)")

console.time("fiboJS (JS)")
fiboJS(40)
console.timeEnd("fiboJS (JS)")

function fiboJS(n) {
	return n <= 1 ? n : fiboJS(n - 1) + fiboJS(n - 2)
}
