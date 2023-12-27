Comparing Rust, TinyGo, Zig and C/C++ compilers for creating simple wasm functions (like Fibonacci).

## Simplicity

- Zig: 1 (winner)
- TinyGo: 2
- C/C++: 2
- Rust: 3

Rust demands to install some packages. The process is much slower. Multiple ways to make Rust compatible with Wasm, so you don't know what technique is the right. In the end, I couldn't make it work because of a weird unexplicable bug.

Rust is much more complicated. A lot of different (and heavy tools to install). Issues with rustc / rustup caused errors.

TinyGo is very simple to use with WASI, but you can't use it for a pure WASM library.

C++ is not so easy, but it's achievable once you've got the right option.

## Output quality

- Zig: 1 (winner)
- Rust: 1
- C/C++: 2
- TinyGo: 5

Rust and Zig have a very clean output with the right options. Again it's more complex to find how to use this options with Rust. With Zig, it's a simple tag.

They are the only ones that produced a WASM output faster than native JS. This means they are the only one that make sense to use WASM with!

C/C++ have a small overhead that makes the difference. For a Fibonacci test, the C/C++ wasm function is 2x slower than the native JS function, while the Zig wasm function is 40% faster using Bun (3x faster using Deno, but because the JS function is very slow).

It must be even worse with TinyGo.

# Conclusion

If you want to produce Wasm, only use Zig or Rust.

C/C++, Go and Tinygo wasm outputs are slower than native JS, so there is not point in using it. Well-made JS may be faster.
