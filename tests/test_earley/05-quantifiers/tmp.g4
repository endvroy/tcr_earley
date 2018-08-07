grammar tmp;

CNF_TERM_0: '0';
CNF_TERM_1: '1';
CNF_TERM_2: '2';


a
  : a_suffix_1 a_bin_2
  | a_suffix_2 a_bin_1
  | c a_suffix_2
  | CNF_TERM_1
  ;

a_bin_1
  : a_suffix_3 a_suffix_5
  | CNF_TERM_2
  | a_block_4 a_suffix_5
  | a b
  ;

a_bin_2
  : a_suffix_2 a_bin_1
  | c a_suffix_2
  | CNF_TERM_1
  ;

a_block_4
  : a b
  ;

a_suffix_1
  : b a_suffix_1
  | CNF_TERM_0
  ;

a_suffix_2
  : c a_suffix_2
  | CNF_TERM_1
  ;

a_suffix_3
  : CNF_TERM_2
  ;

a_suffix_5
  : a_block_4 a_suffix_5
  | a b
  ;

b
  : CNF_TERM_0
  ;

c
  : CNF_TERM_1
  ;

cnf_start
  : a_suffix_1 a_bin_2
  | a_suffix_2 a_bin_1
  | c a_suffix_2
  | CNF_TERM_1
  ;
