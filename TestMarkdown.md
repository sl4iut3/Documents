# devt en markdown
----------------------

## Introduction

recensement de différents outils libres

- pandoc
- odptodown: permet de transformer une présentation Impress en Markdown

----------------------

## quelques essais (rien à voir)

$a^2=b$



```python
def f(x):
    return 2*x
```
---------------------------

## la suite

Code with syntax highlighting

Here's what a delimited code block looks like:

    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.haskell}
    -- | Inefficient quicksort in haskell.
    qsort :: (Enum a) => [a] -> [a]
    qsort []     = []
    qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
                   qsort (filter (>= x) xs) 
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

And here's how it looks after syntax highlighting:

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.haskell}
-- | Inefficient quicksort in haskell.
qsort :: (Enum a) => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort (filter (< x) xs) ++ [x] ++
               qsort (filter (>= x) xs) 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Here's some python, with numbered lines (specify `{.python .numberLines}`):

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.python .numberLines}
class FSM(object):

"""This is a Finite State Machine (FSM).
"""

def __init__(self, initial_state, memory=None):

    """This creates the FSM. You set the initial state here. The "memory"
    attribute is any object that you want to pass along to the action
    functions. It is not used by the FSM. For parsing you would typically
    pass a list to be used as a stack. """

    # Map (input_symbol, current_state) --> (action, next_state).
    self.state_transitions = {}
    # Map (current_state) --> (action, next_state).
    self.state_transitions_any = {}
    self.default_transition = None
    ...
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 

## la suite (encore)

  Right     Left     Center     Default
-------     ------ ----------   -------
     12     12        12            12
    123     123       123          123
      1     1          1             1

Table:  Demonstration of simple table syntax.

-   le signal variable peut-être:

    -   un signal sinusoidal (pour comprendre et simplifier les calculs)

    -   un signal analogique quelconque (dans la réalité)

    -   un signal binaire (en transmission de données)

-   le signal dont on modifie l’amplitude est nommé signal porteur $s_p$
    de fréquence $f_p$.

-   le signal qui remplace l’amplitude de $s_p(t)$ est nommé signal
    modulant $s_m$.
