H08 H08         4X    unc (param i32) (result i32)))
  (func (;0;) (type 0) (param i32) (result i32)
    (local i32)
    local.get 0
    i32.const 2
    i32.ge_u
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 1
        i32.sub
        call 0
        local.get 1
        i32.add
        local.set 1
        local.get 0
        i32.const 2
        i32.sub
        local.tee 0
        i32.const 1
        i32.gt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    i32.add)
  (memory (;0;) 16)
  (export "memory" (memory 0))
  (export "fibonacci" (func 0)))
