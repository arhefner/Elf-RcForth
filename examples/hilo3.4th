VARIABLE SECRET
VARIABLE TURN
: RAND16U RAND 4 LSHIFT RAND OR ;
: RAND16S RAND16U 0x7FFF AND ;
: GAMEINIT 0#0  TURN ! RAND16S 0#1000  MOD SECRET ! ; 
: GAMESO ." I'm thinking of a number from 0 to 1000. You guess it" CR ; 
: LOW ." Sorry, too low. Try again." CR ; 
: RIGHT ." You got it in " TURN @ . ." tries! Good job. Enter play to try again." CR ; 
: GUESS 0#1  TURN +! DUP SECRET @ = IF RIGHT ELSE SECRET @ < IF LOW ELSE HIGH THEN THEN ; 
: HIGH ." Oops, too high. Try again." CR ; 
VARIABLE MLINPUT                                                                
0x1E ALLOT                                                                      
0xF82F MLINPUT 0x00 + !                                                         
0xAF73 MLINPUT 0x02 + !                                                         
0xF808 MLINPUT 0x04 + !                                                         
0xBF73 MLINPUT 0x06 + !                                                         
0xF8FF MLINPUT 0x08 + !                                                         
0xACF8 MLINPUT 0x0A + !                                                         
0xBC MLINPUT 0x0C + !                                                           
0xD4FF MLINPUT 0x0E + !                                                         
0x6960 MLINPUT 0x10 + !                                                         
0x72BF MLINPUT 0x12 + !                                                         
0x02AF MLINPUT 0x14 + !                                                         
0xD4FF MLINPUT 0x16 + !                                                         
0x5D9D MLINPUT 0x18 + !                                                         
0xBB8D MLINPUT 0x1A + !                                                         
0xABD5 MLINPUT 0x1C + !                                                         
VARIABLE IBUFFER                                                                
0xFF ALLOT                                                                      
: BFINPUT DUP 0xFF  AND MLINPUT 1+ C! 0x08  RSHIFT MLINPUT 0x05  + C! MLINPUT 0x09  + C! MLINPUT EXEC ;                                                         
: IINPUT 0xFF  IBUFFER BFINPUT CR ;
: PLAY CLS GAMEINIT GAMESO BEGIN ." Your guesss? " IINPUT DUP GUESS SECRET @ = UNTIL ;
