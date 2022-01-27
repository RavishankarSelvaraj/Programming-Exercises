! Function Plotter, a program that draws the graph of the function sin(x)
! author: Ravishankar Selvaraj (2036915)
program Exercise_4
	
	implicit none
	
	character, dimension(79, 23) :: plot = ' ' 
	integer :: i, j !rows and columns
	double precision :: y
	real, parameter :: pi = 3.1415927
	
	! y - axis
	do i = 1, 23 
		plot(38, i) = '|'
	end do
	
	! x - axis 
	do j = 1, 79 
		plot(j, 12) = '-'
	end do
	
	! draw function x -> sin(x)
	do j = 1, 79 
		! formula: y = sin((2*pi*i/rows) + pi)
		y = dble(j) * dble(2) * dble(pi) / dble(79)
		y = sin(y+pi)
		! now find out what is the row indice
		y = 11-(11*y)
		plot(j, nint(y) + 1) = '*'
	end do
	
	! print array
	print "(79(A1))", plot

end program Exercise_4
