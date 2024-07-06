# Custom-multiplier
A low level descripion of a 4 bit unsigned multiplier. A brutal
In this code there is an idea of a brute-force approach to multiplication by reaching the maximum clock frequency perfomance allowed by the board, i.e., 2.2 ns. The approach I invented considers each number (they are integers) as the product of its prime divisors. Obviously for prime numbers a pre-sum must be done, but for all other results that do not have prime numbers as divisors, the result is instantaneous, needing only a mux delay. For example a=15 and b= 12 => a*b= sum 12 times a. To sum 12 times a is to make a*6*2. But because multiplying by two in binary means left-shift I can do a*6 and then a left shift. This is the basic idea, it must be extended to each case that is 16 since it is 4 bits. For every possible value of b my circuit knows what to do.
