; ModuleID = 'whileifthenelse.c'
source_filename = "whileifthenelse.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "leros32-unknown-unknown-elf"

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 @rand() #2
  store i32 %call, i32* %x, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, i32* %x, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %x, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %x, align 4
  %2 = load i32, i32* %x, align 4
  %cmp1 = icmp sgt i32 %2, 50
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %3 = load i32, i32* %x, align 4
  %inc2 = add nsw i32 %3, 1
  store i32 %inc2, i32* %x, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %4 = load i32, i32* %x, align 4
  %mul = mul nsw i32 %4, 2
  store i32 %mul, i32* %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load i32, i32* %x, align 4
  ret i32 %5
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 8.0.0 (https://github.com/leros-dev/leros-clang.git ba93d76b060e90d82b2f3f3ccc6488c308790562) (https://github.com/leros-dev/leros-llvm.git 10c41408d56fa25c0b64f87b93e7c6f43542361e)"}
