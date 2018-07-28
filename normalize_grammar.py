from normalize_antlr4 import make_builder


def to_cnf(grammar_path, start):
    builder = make_builder(grammar_path)
    builder.to_cnf(start)
    s = builder.to_antlr_string()
    with open('tmp.g4', 'w') as f:
        f.write('grammar tmp;\n\n')
        f.write(s)
