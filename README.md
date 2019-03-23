# Test Case Reduction with Skippy Earley Parsing

Test Case Reduction is the task to minimize the test case but still reproduce the same bug.

When doing test case reduction, sometimes the grammar of the tests is known. We can make use of this knowledge to guide test case reduction. The intuition is for each token, we can choose to add or skip it. Adding the token will update the parsing items accordingly, while skipping it will forward the same items towards the next step. In the last step, we extract all successful items as the minimized test case.

The Earley parser has a natural work flow for this application, since the Earley parsing algorithm is designed to work with ambiguous grammars that can potentially lead to multiple parse trees for a given input. We augmented the Earley parsing algorithm with a `SKIP` action that ignores the current token and forward the parsing items.
