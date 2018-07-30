grammar tmp;

CNF_TERM_0: '0';
CNF_TERM_1: '1';
CNF_TERM_2: '2';
CNF_TERM_3: '3';


b
  : terminal_1 terminal_2
  ;

c
  : terminal_3 terminal_4
  ;

cnf_start
  : b c
  ;

terminal_1
  : CNF_TERM_0
  ;

terminal_2
  : CNF_TERM_1
  ;

terminal_3
  : CNF_TERM_2
  ;

terminal_4
  : CNF_TERM_3
  ;
