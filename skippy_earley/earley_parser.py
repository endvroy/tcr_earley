from collections import defaultdict, deque
import itertools


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
        item_set = ItemSet()
        for x in self.rules[self.starting_symbol]:
            item_set.add(Item(x))
        return item_set


class Item:
    """Represents an Earley item."""

    def __init__(self, rule, dot=0, at=0, skip=None):
        # CFG Rule.
        self.rule = rule
        # Dot position in the rule.
        self.dot = dot
        # position in the token stream
        self.at = at
        # skipped pos
        self.skip = skip

    def copy(self):
        return Item(self.rule, self.dot, self.at, self.skip)

    def __eq__(self, other):
        return self.rule == other.rule \
               and self.dot == other.dot \
               and self.at == other.at \
               and self.skip == other.skip

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


class SingleParentInfo:
    is_combined = False

    def __init__(self, parent=None):
        self.parent = parent

    def __repr__(self):
        return f'SingleParentInfo({self.parent})'

    def __eq__(self, other):
        return self.is_combined == other.is_combined \
               and self.parent is other.parent

    def __hash__(self):
        return hash(self.is_combined) ^ id(self.parent)


class CombinedParentInfo:
    is_combined = True

    def __init__(self, prev_parent, parent):
        self.prev_parent = prev_parent
        self.parent = parent

    def __repr__(self):
        return f'CombinedParentInfo({self.prev_parent}, {self.parent})'

    def __eq__(self, other):
        return self.is_combined == other.is_combined \
               and self.prev_parent is other.prev_parent \
               and self.parent is other.parent

    def __hash__(self):
        return hash(self.is_combined) ^ id(self.prev_parent) ^ id(self.parent)


class CacheSet:
    def __init__(self, items=None):
        if items is None:
            items = set()
        self.items = set(items)

    def __iter__(self):
        return iter(self.items)

    def __contains__(self, item):
        return item in self.items

    def __len__(self):
        return len(self.items)

    def add(self, item):
        """Add the given item (if it hasn't already been added)."""
        self.items.add(item)

    def __ior__(self, other):
        self.items |= other.items
        return self

    def __repr__(self):
        return f'CacheSet({repr(self.items)})'


class ItemSet:
    """Represents an entry in the chart used by the Earley algorithm."""

    def __init__(self, items=None):
        if items is None:
            self.items = {}
        else:
            self.items = items

    def __iter__(self):
        return iter(self.items)

    def __contains__(self, item):
        return item in self.items

    def __len__(self):
        return len(self.items)

    def add(self, item, parent_info=None):
        """Add the given item (if it hasn't already been added)."""
        if item not in self.items:
            self.items[item] = set()
        if parent_info is not None:
            self.items[item].add(parent_info)

    def link(self):
        """link each item to its parents set"""
        for item, par_set in self.items.items():
            item.parents = par_set

    def __ior__(self, other):
        for item, parents in other.items.items():
            self.add(item)
            self.items[item] |= parents
        return self

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
        item_set = CacheSet()
        for rule in self.grammar[item.next_symbol()]:
            new_item = Item(rule, dot=0, at=pos)
            if self._is_new_item(new_item, current_set, next_set, self.table[pos]):
                item_set.add(new_item)
            self.table[pos].add(new_item)
        return item_set

    def scan(self, item, pos):
        if pos < len(self.tokens):
            word = self.tokens[pos]
            if word == item.next_symbol():
                new_item = Item(item.rule,
                                dot=item.dot + 1,
                                at=item.at)
                self.table[pos + 1].add(new_item, SingleParentInfo(item))

    def complete(self, item, pos, current_set, next_set):
        item_set = CacheSet()
        for prev_item in CacheSet(self.table[item.at]):
            if prev_item.next_symbol() == item.rule.lhs:
                new_item = Item(prev_item.rule,
                                dot=prev_item.dot + 1,
                                at=prev_item.at)
                if self._is_new_item(new_item, current_set, next_set, self.table[pos]):
                    item_set.add(new_item)

                self.table[pos].add(new_item, CombinedParentInfo(prev_item, item))
        return item_set

    def skip(self, pos):
        if pos + 1 == len(self.table):
            return
        else:
            for item in self.table[pos]:
                x = Item(item.rule,
                         item.dot,
                         item.at,
                         pos)
                self.table[pos + 1].add(x, SingleParentInfo(item))

    @staticmethod
    def _is_new_item(item, current_set, next_set, table_set):
        return not (item in current_set or item in next_set or item in table_set)

    def _link(self):
        for item_set in self.table:
            item_set.link()

    def parse(self):
        for pos, item_set in enumerate(self.table):
            print(f'pos={pos}')
            current_set = CacheSet(item_set)
            next_set = CacheSet()
            while current_set:
                for item in current_set:
                    if not item.is_complete():
                        if self.grammar.is_terminal(item.next_symbol()):
                            self.scan(item, pos)
                        else:
                            next_set |= self.predict(item, pos, current_set, next_set)
                    else:
                        next_set |= self.complete(item, pos, current_set, next_set)

                # self.table[pos] |= current_set
                current_set = next_set
                next_set = CacheSet()
            self.skip(pos)

        self._link()

    def extract_skips_recursive(self, item):
        """all possible skips to get this item"""
        if item.parents:
            # combine info from each parent
            for p in item.parents:
                yield from self._combine_parent_skips(item, p)
        else:
            # base case: no parents
            if item.skip is not None:
                yield (item.skip,)  # only one possible skips, which is to skip `item.skip`
            else:
                yield ()  # only one possible skips, which is to skip nothing

    def _combine_parent_skips(self, item, parent_info):
        """all possible skips to get the item from this parent"""
        skips = ((),)
        if item.skip is not None:
            skips = ((item.skip,),)

        if parent_info.is_combined:
            prev_item, parent_item = parent_info.prev_parent, parent_info.parent
            yield from map(itertools.chain.from_iterable,
                           itertools.product((tuple(x) for x in self.extract_skips_recursive(prev_item)),
                                             (tuple(x) for x in self.extract_skips_recursive(parent_item)),
                                             skips))
        else:
            yield from map(itertools.chain.from_iterable,
                           itertools.product(self.extract_skips_recursive(parent_info.parent), skips))

    def _is_desired(self, item):
        return item.rule in self.grammar[self.grammar.starting_symbol] \
               and item.at == 0 and \
               item.is_complete()

    def extract(self):
        """each yield is an iterator of possible skip positions"""
        seen = set()
        for item in self.table[-1]:
            if self._is_desired(item):
                for it in self.extract_skips_recursive(item):
                    si = tuple(it)
                    if si not in seen:
                        seen.add(si)
                        yield si
