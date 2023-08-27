; This file can hold definitions you don't want in the "standard" definitions
#ifdef NO_TOKEN_COMPRESSION
  db ': init ;',0
#else
  db FCOLON,'INIT',FSEMI,0
#endif

