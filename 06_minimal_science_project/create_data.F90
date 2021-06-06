program create_data
    implicit none
    integer :: istep
    real :: alpha, signal, r, noise

    do istep = 0, 24
        ! sinusoidal signal between 0 and 360 deg
        alpha = istep * 15.0
        signal = 3.0 * sind(alpha)
        
        ! random noise (symmetric random number in +/- 0.2)
        call random_number(r)
        noise = 0.2 * (2.0 * r - 1.0)
        
        ! write all to stdout
        write(*,*) alpha, signal + noise
    end do
  end program create_data