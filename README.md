# Testing Wasm Fibonacci with some different languages

Comparing Rust, TinyGo, Zig and C/C++ compilers for creating a simple Fibonacci function in wasm.

## Results

<table>
  <tr>
    <th></th>
    <th>Native JS</th>
    <th>Zig</th>
    <th>Rust</th>
    <th>C / C++</th>
    <th>Tinygo</th>
  </tr>

  <tr>
    <th>Size</th>
    <td>57 bytes</td>
    <td>110 bytes</td>
    <td>222 bytes</td>
    <td>514 bytes</td>
    <td>86.000 bytes</td>
  </tr>
    
  <tr>
    <th><i>(Bun)</i> Speed</th>
    <td>665 ms</td>
    <td>410 ms</td>
    <td>550 ms</td>
    <td>414 ms</td>
    <td>*</td>
  </tr>

  <tr>
    <th><i>(Deno)</i> Speed</th>
    <td>1.351 ms</td>
    <td>432 ms</td>
    <td>453 ms</td>
    <td>455 ms</td>
    <td>*</td>
  </tr>

  <tr>
    <th><i>(Node)</i> Speed</th>
    <td>1.464 ms</td>
    <td>745 ms</td>
    <td>758 ms</td>
    <td>714 ms</td>
    <td>*</td>
  </tr>
</table>

\* It's not possible to create a library of Wasm functions with TinyGo, only executables.

## Synthesis

- Bun is naturally faster than Bun and Node for executing Fibonacci. This is likely due to the runtime difference, V8 seems not as fast for handling numbers.
- Node is significantly slower than Bun and Deno to run a Wasm function. Another good reason to drop Node for newer alternatives.
- Zig produces a very small output. Twice as small as Rust's Wasm, and almost 5x as small as C/C++ Wasm.
- Tinygo produces a huge output and is not actually usable as a library. It's the drawback of having a garbage collector language: you have to load the garbage collector code in the Wasm file.


## Note about simplicity

- Zig: 1 (winner)
- TinyGo: 2
- C/C++: 2
- Rust: 3

Rust demands to install some packages. The process is much slower. Multiple ways to make Rust compatible with Wasm, so you don't know what technique is the right. In the end, I couldn't make it work because of a weird unexplicable bug.

Rust is much more complicated. A lot of different (and heavy tools to install). Issues with rustc / rustup caused errors.

TinyGo is very simple to use with WASI, but you can't use it for a pure WASM library.

C++ is not so easy, but it's achievable once you've got the right option. 

### Commands used to compile to wasm

#### Zig

```sh
zig build-lib fibo.zig -target wasm32-freestanding -dynamic -rdynamic -O ReleaseSmall
```

`-dynamic` and `-rdynamic` are used to make all exported functions available in the Wasm file.

#### Rust

```sh
wasm-pack build --target web
```

#### C / C++

```sh
clang++ --target=wasm32 -emit-llvm -Os -c -S -o ./fibo.ll ./fibo.cpp
llc -march=wasm32 -filetype=obj -o ./fibo.o ./fibo.ll
wasm-ld --no-entry --export-all -o ./fibo.wasm ./fibo.o
```

Note: don't forget the `-Os` option (optimize speed) that will also optimize execution speed.

## Conclusion

If you want to produce small and efficient Wasm, use Zig, Rust or optimized C/C++.

**Never use a garbage collected language** like Go or C#. Your code will be much larger to load, and might we as well slower than native JS.
