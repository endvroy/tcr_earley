grammar tmp;

CNF_TERM_0: '0';
CNF_TERM_1: '1';
CNF_TERM_2: '2';


a_bin_1
  : c d
  | CNF_TERM_1
  ;

b
  : CNF_TERM_0
  ;

c
  : CNF_TERM_1
  | CNF_TERM_2
  ;

cnf_start
  : b a_bin_1
  ;

d
  : CNF_TERM_1
  ;
