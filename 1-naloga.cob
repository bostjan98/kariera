       IDENTIFICATION DIVISION.
       PROGRAM-ID. 1-naloga.
       AUTHOR. Bostjan Karlic.
       DATE-WRITTEN. April 22nd 2023.
       ENVIRONMENT DIVISION.
   
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           01 MOJTEXT PIC X(20) VALUE "To je moj text".
           01 NOVTEXT PIC X(20).

       PROCEDURE DIVISION.
           DISPLAY "OLD text : " MOJTEXT.
           STRING MOJTEXT DELIMITED BY "moj"
           "tvoj" DELIMITED BY SIZE
           INTO NOVTEXT
           END-STRING
           STRING NOVTEXT(1:9)
               MOJTEXT(9:11)
               DELIMITED BY SIZE
               INTO NOVTEXT
           END-STRING
           DISPLAY "NEW text: " NOVTEXT.
           STOP RUN.