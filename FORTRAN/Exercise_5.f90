! Fortran: CG Method, a system of linear equations Ax = b can be solved with the conjugate gradient method
! author: Ravishankar Selvaraj (2036915)
program Exercise_5
	
	implicit none
	
	double precision, allocatable, dimension(:, :) :: a
	double precision, allocatable, dimension(:) :: b, x
	integer :: i, n
	
	! user enters integer number and decides dimension of A
	write (*, "(A)", advance = "no") "symmetric positive definite matrix size i: "
	read *, n
	allocate(a(n, n))
	allocate(b(n))
	
	! create test matrix A and right hand side b
	do i = 1, n
		a(i, i) = 6
	end do
	do i = 2, n
		a(i, i - 1) = -2
		a(i - 1, i) = -2
	end do
	do i = 1, n
		b(i) = sqrt(real(i))
	end do
	
	! call cg method
	call cg(a, b, x)
	
	! check the result by computing and printing norm(b-Ax)
	print *, "norm(b - A*x) = ", norm2(b - matmul(a, x))
	
contains
	subroutine cg(a, b, x)
		implicit none
		double precision, dimension(:, :), intent(in) :: a
		double precision, dimension(:), intent(in) :: b
		double precision, allocatable, dimension(:), intent(out) :: x
		double precision, allocatable, dimension(:) :: r, d
		integer :: k, n
		double precision :: alpha, beta, dot_product_r
		n = size(b)
		allocate (x(n), r(n), d(n))
		x = 0.0
		r = b - matmul(a, x)
		d = r
		k = 0
		do while (norm2(r)>10e-14)
			dot_product_r = dot_product(r, r)
			alpha = dot_product_r / dot_product(d, matmul(a, d))
			x = x + alpha * d
			r = r - alpha * matmul(a, d)
			print *, "k = ", k
			print *, "norm(r_(k+1)) = ", norm2(r)
			beta = dot_product(r, r) / dot_product_r
			d = r + beta * d
			k = k + 1
		end do
	end subroutine cg
end program Exercise_5


