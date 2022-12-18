.data 
N:
.word 6
M:
.word 6

array:
.word -2, -94, -13, -5,    0, -21
.word -1,  -4, -13, -5,    0, -21
.word -5,  -2, -10, -5,    0, -21
.word -1, -46,  -1, -5,    0, -21
.word -5, -23,  -7, -5,    0, -21
.word -20, -74, -13, -5, 100,-200

result:
.word 0

msg:
.string " column with maximum sum of elements\n"


.text
main:

  la   t1, N
  la   t2, M
  
  lw   a1, 0(t1)      # a1 = N number of lines
  lw   a2, 0(t2)      # a2 = M number of columns
  la   a3, array      # a3 = addr first element of array  
  la   a4, result     # a4 = addr cell of result

  call process
  sw   a0, 0(a4)
  call print_result

# end program  
  addi a0, x0, 10 
  ecall


process:
  addi sp, sp, -4
  sw   s0, 0(sp) 
# ==================================================================================
# == FUNC: BEGIN 
# == t0 - address offset by line length 
# == t1 - index column
# == t2 - index line 
# == t3 - current sum
# == t4 - largest sum
# == t5 - current element of array
# == t6 - base addr (addr first element in column)
# == s0 - address offset by line length (line length * 4)

  addi t1, x0, 0           # index column - t1 (t1 = 0)
  li   t4, -2147483648     # largest sum (init by min number)  
  addi a0, x0, 0           # result 
  slli t0, a1, 2           # address offset by line length 
  addi s0, x0, 0           # addr offset in line 

loop_column:

  addi t2, x0, 0           # 
  addi t3, x0, 0           # current sum 
  add  t6, a3, s0          # base addr (first element in column)
  
# ---------------------------------------------------------------------------------
loop_line:          
  lw   t5, 0(t6)           # load current array element  
  add  t3, t3, t5          # current sum = current_sum + array element

  addi t2, t2, 1           # increment line index
  add  t6, t6, t0          # add offset to current addr for find addr next element [i + 1:j]
  bne  a2, t2, loop_line   # if (line index != number of lines) PC --> loop_line
# ---------------------------------------------------------------------------------
  blt  t3, t4, Bypass      # if (current sum < largest sum) PC --> Bypass
  addi t4, t3, 0           # largest sum = current sum
  addi a0, t1, 0           # result = index column

Bypass: 
  addi s0, s0, 4           # addr of next first element of column           
  addi t1, t1, 1           # increment index line
  bne  a1, t1, loop_column # if (line index != line number) PC --> loop_line
# == FUNC: END 
# ==================================================================================
  lw   s0, 0(sp)
  addi sp, sp, 4
  ret



print_result:  
  addi a0, x0, 1
  lw   a1, 0(a4)
  ecall
  addi a0, x0, 4      
  la a1, msg
  ecall
  ret
