grammar tmp;

CNF_TERM_0: '0';
CNF_TERM_1: '1';
CNF_TERM_2: '2';


a_block_1
  : CNF_TERM_1
  | CNF_TERM_2
  ;

b
  : CNF_TERM_0
  ;

cnf_start
  : b a_block_1
  ;
