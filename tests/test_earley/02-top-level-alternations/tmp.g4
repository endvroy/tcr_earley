grammar tmp;

CNF_TERM_0: '0';
CNF_TERM_1: '1';
CNF_TERM_2: 'a';
CNF_TERM_3: 'b';


b
  : CNF_TERM_0
  | CNF_TERM_1
  ;

c
  : CNF_TERM_2
  | CNF_TERM_3
  ;

cnf_start
  : b c
  | c b
  ;
