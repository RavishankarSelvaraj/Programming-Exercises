! Calculator with the operations +, -, *, / and ^ 
! author: Ravishankar Selvaraj (2036915)
program Exercise_2

	implicit none
	
	double precision :: a, b
	character :: c
	logical :: endCalculator = .true.
	
	print *, "Input (double, operator, double): "
	
	do while (endCalculator)
		read *, a, c, b
		select case (c)
		case ("+")
			print *, a + b
		case ("-")
			print *, a - b
		case ("*")
			print *, a * b
		case ("^")
			print *, a ** b
		case ("/")
			if(b == 0) then
				print *, "error: division by 0"
			else 
				print *, a / b
			end if
		case ("#")
			endCalculator = .false.
		case default
			print *, "error: unknown operator"
		end select
	end do
	
end program Exercise_2
