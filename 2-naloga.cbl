       IDENTIFICATION DIVISION.
       PROGRAM-ID. 2-naloga.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
         01 WS-NETWORTH PIC S9(11)V99 VALUE 121.33.
         01 WS-TAXRATE PIC 9(3)V9(3) VALUE 19.351.
         01 WS-TAXVALUE PIC S9(11)V9(02).
         01 WS-NUM11 PIC S9(1)V9(03).
         01 WS-GROSSVALUE PIC S9(11)V99.

       PROCEDURE DIVISION.
         CALL "t_calc" USING WS-NETWORTH, WS-TAXRATE, WS-TAXVALUE, 
         WS-GROSSVALUE.
         DISPLAY "Net Worth: ", WS-NETWORTH.
         DISPLAY "Tax Rate: ", WS-TAXRATE.
         DISPLAY "Tax Value: ", WS-TAXVALUE.
         DISPLAY "Gross Value: ", WS-GROSSVALUE.
         STOP RUN.