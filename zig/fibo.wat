8c8 8c8         4X    unc (param i32) (result i32)))
  (func (;0;) (type 0) (param i32) (result i32)
    (local i32)
    i32.const 0
    local.set 1
    loop (result i32)  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const 1
        i32.gt_s
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        i32.add
        return
      end
      local.get 0
      i32.const -1
      i32.add
      call 0
      local.get 1
      i32.add
      local.set 1
      local.get 0
      i32.const -2
      i32.add
      local.set 0
      br 0 (;@1;)
    end)
  (memory (;0;) 16)
  (global (;0;) (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "fib" (func 0)))
