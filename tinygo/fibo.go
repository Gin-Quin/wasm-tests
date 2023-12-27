package main

//export fib
func fib(n uint64) uint64 {
	if n <= 1 {
		 return n
	}
	return fib(n-1) + fib(n-2)
}

func main() {
	// Prevent the program from exiting immediately.
	select {}
}
