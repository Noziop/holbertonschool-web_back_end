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
