#!/bin/bash

# Création du README.md
cat <<EOT > README.md
# Python Variable Annotations

Ce projet implémente différentes fonctions avec des annotations de type en Python.
Les exercices couvrent les concepts de base des annotations de variables en Python.
EOT

# Exercice 0
cat <<EOT > 0-add.py
#!/usr/bin/env python3
"""Module that provides a function for adding two float numbers."""


def add(a: float, b: float) -> float:
    """Add two floating point numbers.

    Args:
        a (float): First number
        b (float): Second number

    Returns:
        float: The sum of a and b
    """
    return a + b
EOT

# Exercice 1
cat <<EOT > 1-concat.py
#!/usr/bin/env python3
"""Module that provides a function for concatenating strings."""


def concat(str1: str, str2: str) -> str:
    """Concatenate two strings.

    Args:
        str1 (str): First string
        str2 (str): Second string

    Returns:
        str: The concatenation of str1 and str2
    """
    return str1 + str2
EOT

# Exercice 2
cat <<EOT > 2-floor.py
#!/usr/bin/env python3
"""Module that provides a function for floor division."""

import math


def floor(n: float) -> int:
    """Get the floor of a float number.

    Args:
        n (float): The number to floor

    Returns:
        int: The floor of the input number
    """
    return math.floor(n)
EOT

# Exercice 3
cat <<EOT > 3-to_str.py
#!/usr/bin/env python3
"""Module that provides a function for converting float to string."""


def to_str(n: float) -> str:
    """Convert a float to its string representation.

    Args:
        n (float): The number to convert

    Returns:
        str: The string representation of the float
    """
    return str(n)
EOT

# Exercice 4
cat <<EOT > 4-define_variables.py
#!/usr/bin/env python3
"""Module that defines and annotates variables with specified values."""

a: int = 1
pi: float = 3.14
i_understand_annotations: bool = True
school: str = "Holberton"
EOT

# Exercice 5
cat <<EOT > 5-sum_list.py
#!/usr/bin/env python3
"""Module that provides a function for summing a list of floats."""

from typing import List


def sum_list(input_list: List[float]) -> float:
    """Calculate the sum of a list of floats.

    Args:
        input_list (List[float]): List of floats to sum

    Returns:
        float: The sum of all numbers in the list
    """
    return sum(input_list)
EOT

# Exercice 6
cat <<EOT > 6-sum_mixed_list.py
#!/usr/bin/env python3
"""Module that provides a function for summing a list of integers and floats."""

from typing import List, Union


def sum_mixed_list(mxd_lst: List[Union[int, float]]) -> float:
    """Calculate the sum of a list of integers and floats.

    Args:
        mxd_lst (List[Union[int, float]]): List of integers and floats

    Returns:
        float: The sum of all numbers in the list
    """
    return sum(mxd_lst)
EOT

# Exercice 7
cat <<EOT > 7-to_kv.py
#!/usr/bin/env python3
"""Module that provides a function for creating key-value tuples."""

from typing import Union, Tuple


def to_kv(k: str, v: Union[int, float]) -> Tuple[str, float]:
    """Create a tuple from a string and number.

    Args:
        k (str): The string key
        v (Union[int, float]): The number value

    Returns:
        Tuple[str, float]: A tuple containing the string and squared number
    """
    return (k, float(v ** 2))
EOT

# Exercice 8
cat <<EOT > 8-make_multiplier.py
#!/usr/bin/env python3
"""Module that provides a function for creating multiplier functions."""

from typing import Callable


def make_multiplier(multiplier: float) -> Callable[[float], float]:
    """Create a function that multiplies a float by multiplier.

    Args:
        multiplier (float): The multiplier value

    Returns:
        Callable[[float], float]: A function that multiplies by multiplier
    """
    return lambda x: x * multiplier
EOT

# Exercice 9
cat <<EOT > 9-element_length.py
#!/usr/bin/env python3
"""Module that provides a function for calculating lengths of sequence elements."""

from typing import Iterable, Sequence, List, Tuple


def element_length(lst: Iterable[Sequence]) -> List[Tuple[Sequence, int]]:
    """Calculate the length of elements in an iterable of sequences.

    Args:
        lst (Iterable[Sequence]): An iterable containing sequences

    Returns:
        List[Tuple[Sequence, int]]: List of tuples with sequence and its length
    """
    return [(i, len(i)) for i in lst]
EOT

# Rendre tous les fichiers exécutables
chmod +x *.py

echo "✨ Tous les fichiers ont été créés avec succès ! ✨"