\ A serious work in progress -- use this if you don't mind being disappointed
: DBG-NUMBER DUP C@ 0XFF = IF 1+ @ $. ELSE DROP THEN ;
: DBG-STRING DUP C@ 0xFE = NOT IF DROP ELSE BEGIN 1+ DUP C@ DUP DUP IF EMIT ELSE DROP THEN NOT UNTIL 0x20 EMIT DROP THEN ;
: D.S 0x40 OPT ! .S 0x80 OPT ! ;
: DBG-ON 0x80 OPT ! ;
: DBG-OFF 0x40 OPT ! ;
\ Debug with no stack tracing
: DBG-HOOK-NT  '|' EMIT  DUP C@ DUP $. DUP DUP 0x7F > SWAP 0xFD < AND  IF .TOK DROP ELSE DROP DUP DBG-STRING DBG-NUMBER CR THEN ;
\ Or with
: DBG-HOOK-TRACE >R .S R> CR 0x7C EMIT DUP C@ DUP $. DUP DUP 0x7F > SWAP 0xFD < AND IF
 .TOK DROP ELSE DROP DUP DBG-STRING DBG-NUMBER CR THEN ; 
: DBG-HOOK DBG-HOOK-NT ;  \ Pick one

