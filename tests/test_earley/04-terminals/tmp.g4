grammar tmp;

CNF_TERM_0: ~'2';
CNF_TERM_1: ~('0'|'1');


b
  : CNF_TERM_1
  ;

c
  : CNF_TERM_0
  ;

cnf_start
  : b c
  ;
