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
