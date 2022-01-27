! Fortran: BLAS, CBLAS, Maximum of a Vector, a program that checks the performance of the BLAS level 1 operation for the maximum of a vector
! author: Ravishankar Selvaraj (2036915)
program Exercise_7
	
	implicit none
	
	integer :: n, i, ind
	real :: j, start, finish, start2, finish2
	double precision :: maximum
	double precision, allocatable, dimension(:) :: v
	
	! read in the size n of the vector v
	write (*, "(A)", advance = "no") "size n of vector v: "
	read *, n
	allocate(v(n))
	
	! create vector (v_i = tan(i), i=1,...,n)
	do i = 1, n
		j = i
		v(i) = tan(j)
	end do
	
	! find the element with maximum absolut value inside the vector
	call cpu_time(start)
	maximum = 0
	do i = 1, n
		if(abs(v(i)) > maximum) then
			maximum = abs(v(i))
		end if
	end do
	print *, "max = ", maximum
	call cpu_time(finish)
	print '("time for do loop = ", g12.6," seconds.")', finish - start
	
	! use BLAS
	call cpu_time(start2)
	call isamax(n, v, 1)
	ind = isamax(n, v, 1)
	print *, "max = ", v(ind)
	call cpu_time(finish2)
	print '("time for do loop = ", g12.6," seconds.")', finish2 - start2

end program Exercise_7


