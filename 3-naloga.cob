       IDENTIFICATION DIVISION.
       PROGRAM-ID. 3-naloga.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
          FILE-CONTROL.
          SELECT TEXTFILE ASSIGN TO 'stara.txt'
          ORGANIZATION IS LINE SEQUENTIAL. 
          SELECT OUTPUTFILE ASSIGN TO "nova.txt"
          ORGANIZATION IS LINE SEQUENTIAL.            

       DATA DIVISION.
          FILE SECTION.
          FD TEXTFILE.
          01 READ-FILE.
             02 NAME PIC A(500).
          FD OUTPUTFILE.
          01 OUTPUT-FILE. 
               02 O-NAME PIC A(500).  

          WORKING-STORAGE SECTION.
          01 WS-TEXTFILE.
             05 WS-NAME PIC A(500).
          01 COUNTER pic 99.
          01 UC-COUNTER pic 99.
          01 STR pic x(500).
          01 N comp pic 9(4).
          01 WS-EOF PIC A(1). 

       PROCEDURE DIVISION.
           INITIALIZE UC-COUNTER
           OPEN INPUT TEXTFILE
           OPEN OUTPUT OUTPUTFILE
           PERFORM UNTIL WS-EOF='Y'
             READ TEXTFILE INTO WS-TEXTFILE
                AT END MOVE 'Y' TO WS-EOF
                NOT AT END ADD 1 TO COUNTER
                DISPLAY COUNTER " Number of line" 
                MOVE WS-TEXTFILE TO  STR
                PERFORM VARYING N FROM 1 BY 1
                UNTIL STR(N:1) = LOW-VALUE
              IF STR(N:1) IS ALPHABETIC-UPPER
                   INSPECT STR(N:1) CONVERTING
                   "ABCDEFGHIJKLMNOPQRSTUVWXYZ" TO
                   "abcdefghijklmnopqrstuvwxyz"
                   ADD 1 TO UC-COUNTER
              ELSE IF STR(N:1) IS ALPHABETIC-LOWER
                   INSPECT STR(N:1) CONVERTING 
                   "abcdefghijklmnopqrstuvwxyz" TO
                   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
               END-IF
           END-PERFORM
              
           DISPLAY UC-COUNTER " upper case characters"     
           MOVE STR TO O-NAME
           WRITE OUTPUT-FILE
           END-READ
           END-PERFORM.
           CLOSE TEXTFILE
           CLOSE OUTPUTFILE
           STOP RUN.