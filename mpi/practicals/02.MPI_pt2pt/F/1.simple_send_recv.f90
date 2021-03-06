PROGRAM simple_send_recv

!==============================================================!
!                                                              !
! This file has been written as a sample solution to an        !
! exercise in a course given at the CSCS Summer School.        !
! It is made freely available with the understanding that      !
! every copy of this file must include this header and that    !
! CSCS take no responsibility for the use of the enclosed      !
! teaching material.                                           !
!                                                              !
! Purpose: a simple MPI-program printing "hello world!"        !
!                                                              !
! Contents: F-Source                                           !
!==============================================================!

! Program that sends a number from one process to another

   USE MPI
   IMPLICIT NONE

   INTEGER rank, size, number, stat, ierror

   CALL MPI_Init(ierror)

   CALL MPI_Comm_rank(MPI_COMM_WORLD, rank, ierror)
   CALL MPI_Comm_size(MPI_COMM_WORLD, size, ierror)

   IF (size.NE.2) THEN
      WRITE (*,*) 'please run this with 2 processors'
      CALL MPI_Finalize(ierror)
      STOP
   END IF

   IF (rank.EQ.0) THEN
      WRITE (*,*) 'enter number'
      READ (*,*) number
   END IF

   ! Send the contents of number from rank 0 to rank 1 using MPI_Send --- MPI_Recv

   IF (rank.EQ.1) THEN
      WRITE (*,*) 'number communicated', number
   END IF

   CALL MPI_Finalize(ierror)

END PROGRAM
