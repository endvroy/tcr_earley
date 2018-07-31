from collections import defaultdict


class Rule:
    """Represents a CFG rule."""

    def __init__(self, lhs, rhs):
        # Represents the rule 'lhs -> rhs', where lhs is a non-terminal and
        # rhs is a tuple of non-terminals and terminals.
        self.lhs = lhs
        self.rhs = tuple(rhs)

    def __contains__(self, sym):
        return sym in self.rhs

    def __eq__(self, other):
        return self.lhs == other.lhs and self.rhs == other.rhs

    def __getitem__(self, i):
        return self.rhs[i]

    def __len__(self):
        return len(self.rhs)

    def __repr__(self):
        r = ' '.join(str(x) for x in self.rhs)
        return f'Rule({self.lhs} -> {r})'

    def __hash__(self):
        return hash(self.lhs) ^ hash(self.rhs)


class Grammar:
    """Represents a CFG."""

    def __init__(self):
        # The rules are represented as a dictionary from L.H.S to R.H.S.
        self.rules = defaultdict(list)
        self.starting_symbol = None

    def add(self, rule):
        """Adds the given rule to the grammar."""
        self.rules[rule.lhs].append(rule)

    # Returns the rules for a given Non-terminal.
    def __getitem__(self, nt):
        return self.rules[nt]

    def is_terminal(self, sym):
        """Checks is the given symbol is terminal."""
        return len(self.rules[sym]) == 0

    def init_set(self):
        return ItemSet(Item(x) for x in self.rules[self.starting_symbol])


class Item:
    """Represents an Earley item."""

    def __init__(self, rule, dot=0, at=0, skip=None):
        # CFG Rule.
        self.rule = rule
        # Dot position in the rule.
        self.dot = dot
        # position in the token stream
        self.at = at
        # Pointers to previous items
        if skip is None:
            skip = ()
        self.skip = tuple(skip)

    def copy(self):
        return Item(self.rule, self.dot, self.at, self.skip)

    def __eq__(self, other):
        return self.rule == other.rule \
               and self.dot == other.dot \
               and self.at == other.at \
               and self.skip == other.skip  # skip is monotonic

    def __hash__(self):
        return hash(self.rule) ^ hash(self.dot) ^ hash(self.at) ^ hash(self.skip)

    def __len__(self):
        return len(self.rule)

    def __repr__(self):
        a = ' '.join(str(x) for x in self.rule.rhs[:self.dot])
        b = ' '.join(str(x) for x in self.rule.rhs[self.dot:])
        return f'Item({self.rule.lhs} -> {a}*{b}@{self.at}, skip={repr(self.skip)})'

    def next_symbol(self):
        """Return next symbol to parse, i.e. the one after the dot"""
        if self.dot < len(self):
            return self.rule[self.dot]

    def is_complete(self):
        """Checks whether the given item is complete."""
        return len(self) == self.dot


class ItemSet:
    """Represents an entry in the chart used by the Earley algorithm."""

    def __init__(self, items=None):
        # List of Earley items.
        if items is None:
            items = set()
        self.items = set(items)

    def __iter__(self):
        return iter(self.items)

    def __len__(self):
        return len(self.items)

    def add(self, item):
        """Add the given item (if it hasn't already been added)."""
        self.items.add(item)  # list eq hidden in each step

    def copy(self):
        return ItemSet(self.items.copy())

    def __ior__(self, other):
        self.items |= other.items
        return self

    def __or__(self, other):
        return ItemSet(self.items | other.items)

    def __repr__(self):
        return f'ItemSet({repr(self.items)})'


class EarleyParser:
    def __init__(self, tokens, grammar):
        self.tokens = tokens
        self.grammar = grammar
        self.table = [ItemSet() if i > 0
                      else self.grammar.init_set()
                      for i in range(len(self.tokens) + 1)]

    def predict(self, item, pos, current_set, next_set):
        item_set = ItemSet()
        for rule in self.grammar[item.next_symbol()]:
            new_item = Item(rule, dot=0, at=pos)
            if self._is_new_item(new_item, current_set, next_set, self.table[pos]):
                item_set.add(new_item)
        return item_set

    def scan(self, item, pos):
        if pos < len(self.tokens):
            word = self.tokens[pos]
            if word == item.next_symbol():
                self.table[pos + 1].add(Item(item.rule,
                                             dot=item.dot + 1,
                                             at=item.at,
                                             skip=item.skip))

    def complete(self, item, pos, current_set, next_set):
        item_set = ItemSet()
        for prev_item in self.table[item.at]:
            if prev_item.next_symbol() == item.rule.lhs:
                new_item = Item(prev_item.rule,
                                dot=prev_item.dot + 1,
                                at=prev_item.at,
                                skip=prev_item.skip + item.skip)
                if self._is_new_item(new_item, current_set, next_set, self.table[pos]):
                    item_set.add(new_item)

        return item_set

    def skip(self, pos):
        if pos + 1 == len(self.table):
            return
        else:
            for item in self.table[pos]:
                # if item.at < pos:
                x = Item(item.rule,
                         item.dot,
                         item.at,
                         item.skip + (pos,))
                self.table[pos + 1].add(x)

    @staticmethod
    def _is_new_item(item, current_set, next_set, table_set):
        return not (item in current_set or item in next_set or item in table_set)

    def parse(self):
        for pos, item_set in enumerate(self.table):
            # print(f'pos={pos}')
            current_set = item_set.copy()
            next_set = ItemSet()
            while current_set:
                for item in current_set:
                    if not item.is_complete():
                        if self.grammar.is_terminal(item.next_symbol()):
                            self.scan(item, pos)
                        else:
                            next_set |= self.predict(item, pos, current_set, next_set)
                    else:
                        next_set |= self.complete(item, pos, current_set, next_set)

                self.table[pos] |= current_set
                current_set = next_set
                next_set = ItemSet()
            self.skip(pos)

    def extract(self):
        possible_skips = []
        for item in self.table[-1]:
            if item.rule in self.grammar[self.grammar.starting_symbol] \
                    and item.at == 0 and \
                    item.is_complete():
                possible_skips.append(item.skip)
        return possible_skips
