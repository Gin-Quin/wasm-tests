```sh
clang --target=wasm32 -emit-llvm -c -S -o ./fibo.ll ./fibo.c
llc -march=wasm32 -filetype=obj -o ./fibo.o ./fibo.ll
wasm-ld --no-entry --export-all -o ./fibo.wasm ./fibo.o
```