@ Fibonacci
@ Charlie Flux
@ 27/07/2023

	.data
string: .asciz "Value: %d\n"

	.text
	.global main
	.extern printf

main:
	push {ip, lr}

	mov r1, #0 @ n-2
	mov r2, #1 @ n-1
	mov r3, #0 @ n
	mov r4, #0 @ Loop counter

	bl fibonacci

	bx lr

fibonacci:


	add r3, r1, r2

	@ Printing string + r3
	push {r0-r4, lr}
	mov r0, r3
	ldr r0, =string
	bl printf
	pop {r0-r4, lr}


	mov r1, r2
	mov r2, r3

	add r4, r4, #1

	cmp r4, #10
	ble fibonacci

	pop {ip, lr}

