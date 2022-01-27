! Guessing Game, guess a number in seven rounds
! author: Ravishankar Selvaraj (2036915)
program Exercise_3
	
	implicit none
	
	integer :: seed, x, i
	real :: r
	
	! random numbers
	call random_seed(seed)
	call random_number(r)
	r = floor(100 * r)
	
	do i = 1, 7
		print *, "Enter your guess: "
		read *, x
		if (x == r) then
			print *, "Your guess is correct. You won!"
			exit
		else if (x < r) then
			print *, "Wrong guess. Too small!"
		else
			print *, "Wrong guess. Too big!"
		end if
		
		if (i == 7) &
			print *, "Only seven tries. You lost!"
	end do
end program Exercise_3

