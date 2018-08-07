grammar tmp;

CNF_TERM_0: '0';
CNF_TERM_1: '1';


a_bin_1
  : c c
  ;

b
  : d b_bin_1
  ;

b_bin_1
  : d d
  ;

c
  : CNF_TERM_0
  ;

cnf_start
  : b a_bin_1
  | c a_bin_1
  ;

d
  : CNF_TERM_1
  ;
