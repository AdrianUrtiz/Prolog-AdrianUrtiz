const fibonacci = (n) => {
    if (n <= 1) {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

console.log(fibonacci(5))


/*
fibonacci(4)
fibonacci(3) + fibonacci(2)
(fibonacci(2) + fibonacci(1)) + (fibonacci(1) + fibonacci(0))
((fibonacci(1) + fibonacci(0)) + 1) + 1
((1 + 0) + 1) + 1
3
*/