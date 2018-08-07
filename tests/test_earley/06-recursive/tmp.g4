grammar tmp;

CNF_TERM_0: '+';
CNF_TERM_1: '0';
CNF_TERM_2: '1';


a
  : a a_bin_1
  | CNF_TERM_1
  | CNF_TERM_2
  ;

a_bin_1
  : terminal_1 a
  ;

cnf_start
  : a a_bin_1
  | CNF_TERM_1
  | CNF_TERM_2
  ;

terminal_1
  : CNF_TERM_0
  ;
