(module
  (type (;0;) (func))
  (type (;1;) (func (param i32) (result i32)))
  (func (;0;) (type 0))
  (func (;1;) (type 1) (param i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.ge_s
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.add
      return
    end
    i32.const 0
    local.set 1
    loop  ;; label = @1
      local.get 0
      i32.const -1
      i32.add
      call 1
      local.get 1
      i32.add
      local.set 1
      local.get 0
      i32.const 3
      i32.gt_u
      local.set 2
      local.get 0
      i32.const -2
      i32.add
      local.tee 3
      local.set 0
      local.get 2
      br_if 0 (;@1;)
    end
    local.get 3
    local.get 1
    i32.add)
  (memory (;0;) 2)
  (global (;0;) (mut i32) (i32.const 66560))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 66560))
  (global (;5;) i32 (i32.const 1024))
  (global (;6;) i32 (i32.const 66560))
  (global (;7;) i32 (i32.const 131072))
  (global (;8;) i32 (i32.const 0))
  (global (;9;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 0))
  (export "fibo" (func 1))
  (export "__dso_handle" (global 1))
  (export "__data_end" (global 2))
  (export "__stack_low" (global 3))
  (export "__stack_high" (global 4))
  (export "__global_base" (global 5))
  (export "__heap_base" (global 6))
  (export "__heap_end" (global 7))
  (export "__memory_base" (global 8))
  (export "__table_base" (global 9)))
