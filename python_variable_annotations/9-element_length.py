#!/usr/bin/env python3
"""Module that provides a function for calculating lengths of sequence elements."""

from typing import Iterable, List, Sequence, Tuple


def element_length(lst: Iterable[Sequence]) -> List[Tuple[Sequence, int]]:
    """Calculate the length of elements in an iterable of sequences.

    Args:
        lst (Iterable[Sequence]): An iterable containing sequences

    Returns:
        List[Tuple[Sequence, int]]: List of tuples with sequence and its length
    """
    return [(i, len(i)) for i in lst]
